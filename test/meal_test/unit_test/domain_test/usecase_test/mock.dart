import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/response.dart';
import 'package:themeal/meal/domain/entities/area_entity.dart';
import 'package:themeal/meal/domain/entities/category_entity.dart';
import 'package:themeal/meal/domain/entities/meal_entity.dart';
import 'package:themeal/meal/domain/repositories/meal_repository.dart';

class MockMealRepository extends Mock implements MealRepository{
  
  /// get all categories
  @override
  Future<RepositoryResponse> get categories{

    return super.noSuchMethod(
      Invocation.getter(#categories),
      returnValue: Future.value(
        SuccessResponse(
          data: List<CategoryEntity>.empty()
        )
      ),
      returnValueForMissingStub: Future.value(
        SuccessResponse(
          data: List<CategoryEntity>.empty()
        )
      ),
    );
  }

  /// get all areas
  @override
  Future<RepositoryResponse> get areas{
    
    return super.noSuchMethod(
      Invocation.getter(#areas),
      returnValue: Future.value(
        SuccessResponse(
          data: List<AreaEntity>.empty()
        )
      ),
      returnValueForMissingStub: Future.value(
        SuccessResponse(
          data: List<AreaEntity>.empty()
        )
      ),
    );
  }

  /// search meal by meal name
  @override
  Future<RepositoryResponse> search({required String name}){

    return super.noSuchMethod(
      Invocation.method(#search, [], {#name:name}),
      returnValue: Future.value(
        SuccessResponse(
          data: List<MealEntity>.empty()
        )
      ),
      returnValueForMissingStub: Future.value(
        SuccessResponse(
          data: List<MealEntity>.empty()
        )
      ),
    );
  }

  /// get meal detail
  Future<RepositoryResponse> getMeal({required String id}){

    return super.noSuchMethod(
      Invocation.method(#getMeal, [], {#id:id}),
      returnValue: Future.value(
        SuccessResponse(
          data: null
        )
      ),
      returnValueForMissingStub: Future.value(
        SuccessResponse(
          data: null
        )
      ),
    );
  }
}