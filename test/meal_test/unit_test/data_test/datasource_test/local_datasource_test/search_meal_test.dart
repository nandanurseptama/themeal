import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/meal_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var expectedMealData = List<MealModel>.empty();
  var databaseException = Exception('Cannot get data');
  var name = 'Egg Scramble';
  group(
    'Meal Local Data Source Test #SearchMealtTest',
    (){
      test(
        '#1. Should getting data from local database',
        ()async{
          await localDataSourceImpl.search(name: name);
          verify(database.searchMeal(name: name));
        }
      );
      test(
        '#2. When getting data from local database was success. Should return List of MealModel',
        ()async{
          when(database.searchMeal(name: name)).thenAnswer((realInvocation) async=>expectedMealData);
          var result = await localDataSourceImpl.search(name: name);
          expect(result, expectedMealData);
          expect(result, isA<List<MealModel>>());
        }
      );
      test(
        '#3. When getting data from local database was fail. Should throw Local data source exception',
        ()async{
          when(database.searchMeal(name: name)).thenThrow(databaseException);
          var result = localDataSourceImpl.search(name: name);
          expect(
            ()=>result,
            throwsA(isA<LocalDataSourceException>()),
          );
        }
      );
    }
  );
}