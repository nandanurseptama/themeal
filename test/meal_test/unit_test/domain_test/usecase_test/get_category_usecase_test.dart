import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/usecase.dart';
import 'package:themeal/meal/domain/entities/category_entity.dart';
import 'package:themeal/meal/domain/usecases/get_categories_usecase.dart';

import 'fixture.dart';
import 'mock.dart';

void main(){

  late GetCategoryUsecase getCategoryUsecase;
  late MockMealRepository mealRepository;
  setUpAll((){
    mealRepository = MockMealRepository();
    getCategoryUsecase = GetCategoryUsecase(mealRepository: mealRepository);
  });

  group(
    'Get Category Usecase Test :',
    (){
      test(
        '#1. GetCategoryUsecase should getting category data from repository',
        ()async{
          await getCategoryUsecase(NoParams());
          verify(mealRepository.categories);
        }
      );
      test(
        '#2. When getting category data from repository was fail, should return failure response',
        ()async{
          when(mealRepository.categories).thenAnswer((realInvocation) async => getCategoryUsecaseFailureResponse);
          await getCategoryUsecase(NoParams());
          verify(mealRepository.categories);
        }
      );
      group(
        '#3. When getting category data from repository was success',
        (){
          setUpAll((){
            when(mealRepository.categories).thenAnswer((realInvocation) async => getCategoryUsecaseSuccessResponse);
          });
          test(
            '#3.1. Should return success response',
            ()async{
              var response = await getCategoryUsecase(NoParams());
              expect(response, getCategoryUsecaseSuccessResponse);
            }
          );
          test(
            '#3.2. Response data cant be null. Default must be list empty',
            ()async{
              var response = await getCategoryUsecase(NoParams());
              expect(response.data == null, false);
              expect(response.data, isA<List<CategoryEntity>>());
            }
          );
        }
      );
    }
  );
}