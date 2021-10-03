import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/area_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var areas = List<AreaModel>.empty();
  var databaseException = Exception('Cannot insert data');
  group(
    'Meal Local Data Source Test #SaveAreaTest',
    (){
      test(
        '#1. Should Save data into local database',
        ()async{
          await localDataSourceImpl.setAreas(areas: areas);
          verify(database.insertAreas(areas: areas));
        }
      );
      test(
        '#2. When insert data into local database was fail should throw return local data source exception',
        ()async{
          when(database.insertAreas(areas: areas))
          .thenThrow(databaseException);
          var result = localDataSourceImpl.setAreas(areas: areas);
          expect(()=>result, throwsA(isA<LocalDataSourceException>()));
        }
      );
    }
  );
}