import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/category_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var categories = List<CategoryModel>.empty();
  var databaseException = Exception('Cannot insert data');
  group(
    'Meal Local Data Source Test #SaveCategoryTest',
    (){
      test(
        '#1. Should Save data into local database',
        ()async{
          await localDataSourceImpl.setCategories(categories: categories);
          verify(database.insertCategories(categories: categories));
        }
      );
      test(
        '#2. When insert data into local database was fail should throw return local data source exception',
        ()async{
          when(database.insertCategories(categories: categories))
          .thenThrow(databaseException);
          var result = localDataSourceImpl.setCategories(categories: categories);
          expect(()=>result, throwsA(isA<LocalDataSourceException>()));
        }
      );
    }
  );
}