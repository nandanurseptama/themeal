import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/meal/domain/entities/meal_entity.dart';
import 'package:themeal/meal/domain/usecases/search_meal_usecase.dart';

import 'fixture.dart';
import 'mock.dart';

void main(){
  var params = SearchMealUsecaseParams(name: 'Egg Scramble');
  late SearchMealUsecase searchMealUsecase;
  late MockMealRepository mealRepository;
  setUpAll((){
    mealRepository = MockMealRepository();
    searchMealUsecase = SearchMealUsecase(mealRepository: mealRepository);
  });

  group(
    'Search Meal Usecase Test :',
    (){
      test(
        '#1. SearchAreaUsecase should getting meal data filtered by name from repository',
        ()async{
          await searchMealUsecase(params);
          verify(mealRepository.search(name:params.name));
        }
      );
      test(
        '#2. When getting meal data from repository was fail, should return failure response',
        ()async{
          when(mealRepository.search(name:params.name)).thenAnswer((realInvocation) async => searchMealUsecaseFailureResponse);
          await searchMealUsecase(params);
          verify(mealRepository.search(name:params.name));
        }
      );
      group(
        '#3. When getting meal data from repository was success',
        (){
          setUpAll((){
            when(mealRepository.search(name:params.name)).thenAnswer((realInvocation) async => searchMealUsecaseSuccessResponse);
          });
          test(
            '#3.1. Should return success response',
            ()async{
              var response = await searchMealUsecase(params);
              expect(response, searchMealUsecaseSuccessResponse);
            }
          );
          test(
            '#3.2. Response data cant be null. Default must be list empty',
            ()async{
              var response = await searchMealUsecase(params);
              expect(response.data == null, false);
              expect(response.data, isA<List<MealEntity>>());
            }
          );
        }
      );
    }
  );
}