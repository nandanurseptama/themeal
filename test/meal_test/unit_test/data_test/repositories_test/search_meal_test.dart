import 'package:flutter_test/flutter_test.dart';
import 'package:themeal/core/constant/lang.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/core/utils/response.dart';
import 'package:themeal/meal/data/models/meal_model.dart';
import 'package:themeal/meal/data/repositories/meal_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'fixture.dart';
import 'mock.dart';

void main(){
  late MockMealRemoteDataSource mealRemoteDataSource;
  late MockMealLocalDataSource mealLocalDataSource;
  late MealRepositoryImpl mealRepositoryImpl;
  late MockNetworkInfo networkInfo;
  var name = 'Scramble Egg';
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
    'Meal Repository #SearchMeal Test : ',
    (){
      test(
        '#1. Should check internet connection first',
        ()async{
          await mealRepositoryImpl.search(name: name);
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
            '#2.1 Should search meal data from local data source',
            ()async{
              await mealRepositoryImpl.search(name: name);
              verify(mealLocalDataSource.search(name: name));
            }
          );
          test(
            '#2.2 When search meal data from local data source was fail should return failure response',
            ()async{
              when(mealLocalDataSource.search(name: name))
              .thenThrow(LocalDataSourceException.internalError());
              var response = await mealRepositoryImpl.search(name: name);
              expect(
                response,
                isA<FailureResponse>()
              );
              expect(
                response.message,
                AppLang.cantGetSearchResultMealData
              );
            }
          );
          test(
            '#2.3 When search meal data from local data source was fail should return success response',
            ()async{
              when(mealLocalDataSource.search(name: name))
              .thenAnswer((realInvocation) async=> List<MealModel>.empty());
              var response = await mealRepositoryImpl.search(name: name);
              expect(
                response,
                isA<SuccessResponse>()
              );
              expect(
                response.data,
                isA<List<MealModel>>()
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
            '#3.1 Should getting meal data from remote data source',
            ()async{
              await mealRepositoryImpl.search(name: name);
              verify(mealRemoteDataSource.search(name: name));
            }
          );
          test(
            '#3.2 When search meal from remote data source was fail, should return failure response',
            ()async{
              when(mealRemoteDataSource.search(name: name))
              .thenThrow(RemoteDataSourceException.internalServerError());
              var response  = await mealRepositoryImpl.search(name: name);
              expect(
                response,
                isA<FailureResponse>()
              );
              expect(
                response.message,
                AppLang.cantGetSearchResultMealData
              );
            }
          );
          group(
            '#3.3 When search meal from remote data source was success',
            (){
              setUp((){
                when(mealRemoteDataSource.search(name: name))
                .thenAnswer((realInvocation) async=> [meal]);
              });
              test(
                '#3.3.1. Should save to local data',
                ()async{
                  var response  = await mealRepositoryImpl.search(name: name);
                  verify(mealLocalDataSource.setMeal(meal: meal));
                }
              );
              test(
                '#3.3.2. When save to local data was success should return success response',
                ()async{
                  when(mealLocalDataSource.setMeal(meal: meal))
                  .thenAnswer((realInvocation) async=> null);
                  
                  var response = await mealRepositoryImpl.search(name: name);
                  
                  expect(
                    response,
                    isA<SuccessResponse>(),
                  );
                  expect(
                    response.data,
                    isA<List<MealModel>>()
                  );
                  expect(
                    response.data,
                    [meal]
                  );
                }
              );
              test(
                '#3.3.3. When save to local data was fail should return failure response',
                ()async{
                  when(mealLocalDataSource.setMeal(meal: meal))
                  .thenThrow(LocalDataSourceException.internalError());
                  
                  var response = await mealRepositoryImpl.search(name: name);
                  
                  expect(
                    response,
                    isA<FailureResponse>(),
                  );
                  expect(
                    response.message,
                    AppLang.cantGetSearchResultMealData
                  );
                }
              );
            }
          );
        }
      );
    }
  );
}