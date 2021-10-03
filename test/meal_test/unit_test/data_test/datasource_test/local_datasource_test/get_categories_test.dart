import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/models/category_model.dart';

import '../mock.dart';

void main(){
  MockAppDB database = MockAppDB();
  MealLocalDataSourceImpl localDataSourceImpl  = MealLocalDataSourceImpl(database: database);
  var expectedCategoryData = List<CategoryModel>.empty();
  var databaseException = Exception('Cannot get data');
  group(
    'Meal Local Data Source Test #GetCategoryTest',
    (){
      test(
        '#1. Should getting data from local database',
        ()async{
          await localDataSourceImpl.categories;
          verify(database.categories);
        }
      );
      test(
        '#2. When getting data from local database was success. Should return List of CategoryModel',
        ()async{
          when(database.categories).thenAnswer((realInvocation) async=>expectedCategoryData);
          var result = await localDataSourceImpl.categories;
          expect(result, expectedCategoryData);
          expect(result, isA<List<CategoryModel>>());
        }
      );
      test(
        '#3. When getting data from local database was fail. Should throw Local data source exception',
        ()async{
          when(database.categories).thenThrow(databaseException);
          var result = localDataSourceImpl.categories;
          expect(
            ()=>result,
            throwsA(isA<LocalDataSourceException>()),
          );
         
        }
      );
    }
  );
}