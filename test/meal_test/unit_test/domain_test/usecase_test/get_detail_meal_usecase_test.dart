import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/meal/domain/entities/meal_entity.dart';
import 'package:themeal/meal/domain/usecases/get_detail_meal_usecase.dart';

import 'fixture.dart';
import 'mock.dart';

void main(){
  var params = GetDetailMealUsecaseParams(id: '1');
  late GetDetailMealUsecase getDetailMealUsecase;
  late MockMealRepository mealRepository;
  setUpAll((){
    mealRepository = MockMealRepository();
    getDetailMealUsecase = GetDetailMealUsecase(mealRepository: mealRepository);
  });

  group(
    'Get Detail Meal Usecase Test :',
    (){
      test(
        '#1. GetMealDetailUsecase should getting meal data filtered by id from repository',
        ()async{
          await getDetailMealUsecase(params);
          verify(mealRepository.getMeal(id:params.id));
        }
      );
      test(
        '#2. When getting meal data from repository was fail, should return failure response',
        ()async{
          when(mealRepository.getMeal(id:params.id)).thenAnswer((realInvocation) async => getDetailMealUsecaseFailureResponse);
          await getDetailMealUsecase(params);
          verify(mealRepository.getMeal(id:params.id));
        }
      );
      group(
        '#3. When getting meal data from repository was success',
        (){
          setUpAll((){
            when(mealRepository.getMeal(id:params.id)).thenAnswer((realInvocation) async => getDetailMealUsecaseSuccessResponse);
          });
          test(
            '#3.1. Should return success response',
            ()async{
              var response = await getDetailMealUsecase(params);
              expect(response, getDetailMealUsecaseSuccessResponse);
            }
          );
          test(
            '#3.2. Response data must be meal entity (can be null)',
            ()async{
              var response = await getDetailMealUsecase(params);
              expect(response.data, isA<MealEntity?>());
            }
          );
        }
      );
    }
  );
}