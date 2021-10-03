import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/meal_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var meal = expectedMealData();
  var databaseException = Exception('Cannot insert data');
  group(
    'Meal Local Data Source Test #SaveMealTest',
    (){
      test(
        '#1. Should Save data into local database',
        ()async{
          await localDataSourceImpl.setMeal(meal: meal.first);
          verify(database.insertMeals(meals: [meal.first]));
        }
      );
      test(
        '#2. When insert data into local database was fail should throw return local data source exception',
        ()async{
          when(database.insertMeals(meals: [meal.first]))
          .thenThrow(databaseException);
          var result = localDataSourceImpl.setMeal(meal: meal.first);
          expect(()=>result, throwsA(isA<LocalDataSourceException>()));
        }
      );
    }
  );
}
List<MealModel> expectedMealData(){
  var decoded = json.decode(loadMealJson());
  return (decoded['meals'] as List).map((e){
    return MealModel.fromJson(e);
  }).toList();
}