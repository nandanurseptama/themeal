import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/usecase.dart';
import 'package:themeal/meal/domain/entities/area_entity.dart';
import 'package:themeal/meal/domain/usecases/get_areas_usecase.dart';

import 'fixture.dart';
import 'mock.dart';

void main(){

  late GetAreasUsecase getAreasUsecase;
  late MockMealRepository mealRepository;
  setUpAll((){
    mealRepository = MockMealRepository();
    getAreasUsecase = GetAreasUsecase(mealRepository: mealRepository);
  });

  group(
    'Get Area Usecase Test :',
    (){
      test(
        '#1. GetAreaUsecase should getting area data from repository',
        ()async{
          await getAreasUsecase(NoParams());
          verify(mealRepository.areas);
        }
      );
      test(
        '#2. When getting area data from repository was fail, should return failure response',
        ()async{
          when(mealRepository.areas).thenAnswer((realInvocation) async => getAreaUsecaseFailureResponse);
          await getAreasUsecase(NoParams());
          verify(mealRepository.areas);
        }
      );
      group(
        '#3. When getting area data from repository was success',
        (){
          setUpAll((){
            when(mealRepository.areas).thenAnswer((realInvocation) async => getAreaUsecaseSuccessResponse);
          });
          test(
            '#3.1. Should return success response',
            ()async{
              var response = await getAreasUsecase(NoParams());
              expect(response, getAreaUsecaseSuccessResponse);
            }
          );
          test(
            '#3.2. Response data cant be null. Default must be list empty',
            ()async{
              var response = await getAreasUsecase(NoParams());
              expect(response.data == null, false);
              expect(response.data, isA<List<AreaEntity>>());
            }
          );
        }
      );
    }
  );
}