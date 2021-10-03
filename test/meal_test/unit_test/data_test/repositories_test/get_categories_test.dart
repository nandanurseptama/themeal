import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/constant/lang.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/core/utils/response.dart';
import 'package:themeal/meal/data/models/category_model.dart';
import 'package:themeal/meal/data/repositories/meal_repository_impl.dart';

import 'mock.dart';

void main(){
  late MockMealRemoteDataSource mealRemoteDataSource;
  late MockMealLocalDataSource mealLocalDataSource;
  late MealRepositoryImpl mealRepositoryImpl;
  late MockNetworkInfo networkInfo;

  setUpAll((){
    mealRemoteDataSource = MockMealRemoteDataSource();
    mealLocalDataSource = MockMealLocalDataSource();
    networkInfo = MockNetworkInfo();
    mealRepositoryImpl = MealRepositoryImpl(
      networkInfo: networkInfo, 
      mealLocalDataSource: mealLocalDataSource, 
      mealRemoteDataSource: mealRemoteDataSource
    );
  });

  group(
    'Meal Repository #Get Categories Test',
    (){
      test(
        '#1. Should check internet connection first',
        ()async{
          await mealRepositoryImpl.categories;
          verify(networkInfo.isConnected);
        }
      );
      group(
        '#2. When internet connection isnt available',
        (){
          setUp((){
            when(networkInfo.isConnected).thenAnswer((realInvocation) async=> false);
          });
          test(
            '#2.1. Should get categories data from local data source',
            ()async{
              await mealRepositoryImpl.categories;
              verify(mealLocalDataSource.categories);
            }
          );
          test(
            '#2.2 When getting categories data from local data was fail. Should return failure response',
            ()async{
              when(mealLocalDataSource.categories).thenThrow(LocalDataSourceException.internalError());
              var response = await mealRepositoryImpl.categories;
              expect(
                response,
                isA<FailureResponse>()
              );
              expect(
                response.message,
                AppLang.cantGetCategoryData
              );
            }
          );
          test(
            '#2.3 When getting categories data from local data was success. Should return success response with proper data',
            ()async{
              when(mealLocalDataSource.categories).
              thenAnswer((realInvocation) async=> List<CategoryModel>.empty());

              var response = await mealRepositoryImpl.categories;

              expect(
                response,
                isA<SuccessResponse>()
              );
              expect(
                response.data,
                isA<List<CategoryModel>>()
              );
            }
          );
        }
      );
      group(
        '#3. When internet connection is available',
        (){
          setUp((){
            when(networkInfo.isConnected).thenAnswer((realInvocation) async=> true);
          });
          test(
            '#3.1. Should get categories data from remote data source',
            ()async{
              await mealRepositoryImpl.categories;
              verify(mealRemoteDataSource.categories);
            }
          );
          group(
            '#3.2. When get categories data from remote data source was success',
            (){
              setUp((){
                when(mealRemoteDataSource.categories).thenAnswer((realInvocation) async=> List<CategoryModel>.empty());
              });
              test(
                '#3.2.1. should save categories data to local data',
                ()async{
                  await mealRepositoryImpl.areas;
                  verify(mealLocalDataSource.setCategories(categories: List<CategoryModel>.empty()));
                }
              );
              test(
                '#3.2.2. When saving categories data to local data was fail, should return failure response',
                ()async{
                  when(mealLocalDataSource.setCategories(categories: List<CategoryModel>.empty()))
                  .thenThrow(LocalDataSourceException.internalError());
                  var response = await mealRepositoryImpl.categories;
                  expect(
                    response,
                    isA<FailureResponse>(),
                  );
                  expect(
                    response.message,
                    AppLang.cantGetCategoryData,
                  );
                }
              );
              test(
                '#3.2.3. When saving categories data to local data was success, should return success response with proper data',
                ()async{
                  when(mealLocalDataSource.setCategories(categories: List<CategoryModel>.empty()))
                  .thenAnswer((realInvocation) async=> null);
                  var response = await mealRepositoryImpl.categories;
                  expect(
                    response,
                    isA<SuccessResponse>(),
                  );
                  expect(
                    response.data,
                    isA<List<CategoryModel>>()
                  );
                }
              );
            }
          );
          test(
            '#3.3. When get categories data from remote data source was fail',
            ()async{
              when(mealRemoteDataSource.categories)
              .thenThrow(RemoteDataSourceException.internalServerError());
              var response = await mealRepositoryImpl.categories;
              expect(
                response,
                isA<FailureResponse>(),
              );
              expect(
                response.message,
                AppLang.cantGetCategoryData
              );
            }
          );
        }
      );
    }
  );
}