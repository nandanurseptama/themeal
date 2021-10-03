import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/constant/lang.dart';
import 'package:themeal/core/exception/local_data_exception.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/core/utils/response.dart';
import 'package:themeal/meal/data/models/area_model.dart';
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
    'Meal Repository  #Get Areas Test : ',
    (){
      test(
        '#1. Should check internet connection firs',
        ()async{
          await mealRepositoryImpl.areas;
          verify(networkInfo.isConnected);
        }
      );
      /// Internet connection available test case
      group(
        '#2. When internet connection is available',
        (){
          setUp((){
            when(networkInfo.isConnected).thenAnswer((realInvocation) async=> true);
          });
          test(
            '#2.1 Should getting data from remote data source',
            ()async{
              await mealRepositoryImpl.areas;
              verify(mealRemoteDataSource.areas);
            }
          );
          /// Getting from remote data source success case
          group(
            '#2.2 When getting areas data from remote data source was success',
            (){
              setUp((){
                when(mealRemoteDataSource.areas).thenAnswer((realInvocation) async=> Future.value(List<AreaModel>.empty()));
              });
              test(
                '#2.2.1 Should save areas data to local data source',
                ()async{
                  await mealRepositoryImpl.areas;
                  verify(mealLocalDataSource.setAreas(areas: List<AreaModel>.empty()));
                }
              );
              test(
                '#2.2.2 When saving areas data to local data was fail. Should return failure response',
                ()async{
                  when(mealLocalDataSource.setAreas(areas: List<AreaModel>.empty())).thenThrow(
                    LocalDataSourceException.internalError(),
                  );
                  var response = await mealRepositoryImpl.areas;
                  expect(
                    response,
                    isA<FailureResponse>(),
                  );
                  expect(
                    response.message,
                    AppLang.cantGetAreaData,
                  );
                }
              );
              test(
                '#2.2.3 When saving areas data to local data was success. Should return success response with proper data',
                ()async{
                  when(mealLocalDataSource.setAreas(areas: List<AreaModel>.empty())).
                  thenAnswer((realInvocation)async=>null);
                  var response = await mealRepositoryImpl.areas;
                  expect(
                    SuccessResponse(
                      data: List<AreaModel>.empty()
                    ),
                    response
                  );
                  expect(
                    response.data,
                    isA<List<AreaModel>>(),
                  );
                }
              );
            }
          );
          /// Getting from remote data source fail case
          test(
            '#2.3 When getting area data from remote data source was fail. Should return failure response',
            ()async{
              when(mealRemoteDataSource.areas).thenThrow(
                RemoteDataSourceException.badRequest(),
              );
              var response = await mealRepositoryImpl.areas;
              expect(response, isA<FailureResponse>());
              expect(response.message, AppLang.cantGetAreaData);
            }
          );
        }
      );
      group(
        '#3. When internet connection isnt available',
        (){
          setUp((){
            when(networkInfo.isConnected).thenAnswer((realInvocation) async=> false);
          });
          test(
            '#3.1 should getting area data from local data source',
            ()async{
              await mealRepositoryImpl.areas;
              verify(mealLocalDataSource.areas);
            }
          );
          test(
            '#3.2 When getting area data from local data was fail. Should return failure response',
            ()async{
              when(mealLocalDataSource.areas).
              thenThrow(LocalDataSourceException.internalError());
              var response = await mealRepositoryImpl.areas;
              expect(
                response,
                isA<FailureResponse>()
              );
              expect(
                response.message,
                AppLang.cantGetAreaData
              );
            }
          );
        }
      );
    }
  );
}