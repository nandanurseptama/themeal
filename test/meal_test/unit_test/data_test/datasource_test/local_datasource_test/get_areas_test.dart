import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/area_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var expectedAreasData = List<AreaModel>.empty();
  var databaseException = Exception('Cannot get data');
  group(
    'Meal Local Data Source Test #GetAreaTest',
    (){
      test(
        '#1. Should getting data from local database',
        ()async{
          await localDataSourceImpl.areas;
          verify(database.areas);
        }
      );
      test(
        '#2. When getting data from local database was success. Should return List of AreaModel',
        ()async{
          when(database.areas).thenAnswer((realInvocation) async=>expectedAreasData);
          var result = await localDataSourceImpl.areas;
          expect(result, expectedAreasData);
          expect(result, isA<List<AreaModel>>());
        }
      );
      test(
        '#3. When getting data from local database was fail. Should throw Local data source exception',
        ()async{
          when(database.areas).thenThrow(databaseException);
          var result = localDataSourceImpl.areas;
          expect(
            ()=>result,
            throwsA(isA<LocalDataSourceException>()),
          );
         
        }
      );
    }
  );
}