

import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/database.dart';
import 'package:themeal/meal/data/models/area_model.dart';
import 'package:themeal/meal/data/models/category_model.dart';
import 'package:themeal/meal/data/models/meal_model.dart';

import '../../../../utils.dart';
String loadCategoryJson(){
  return readFile(path: 'test/meal_test/unit_test/data_test/datasource_test/category.json');
}
String loadMealJson(){
  return readFile(path: 'test/meal_test/unit_test/data_test/datasource_test/meal.json');
}
String loadAreaJson(){
  return readFile(path: 'test/meal_test/unit_test/data_test/datasource_test/areas.json');
}
class MockDio extends Mock implements Dio{
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }){
    
    return super.noSuchMethod(
      Invocation.getter(#get),
      returnValue: Future.value(
        Response(
          data: {'message':'ok'},
          statusCode: 200,
          requestOptions: RequestOptions(
            path: path,
            cancelToken: cancelToken,
            method: 'GET'
          ),
        )
      ),
      returnValueForMissingStub: Future.value(
        Response(
          data: {'message':'ok'},
          statusCode: 200,
          requestOptions: RequestOptions(
            path: path,
            cancelToken: cancelToken,
            method: 'GET'
          ),
        )
      )
    );
  }
}
class MockAppDB extends Mock implements AppDb{
  
  Future<List<CategoryModel>> get categories async{
    
    return super.noSuchMethod(
      Invocation.getter(#categories),
      returnValue: Future.value(
        List<CategoryModel>.empty(),
      ),
      returnValueForMissingStub: Future.value(
        List<CategoryModel>.empty(),
      )
    );
  }
  Future<void> insertCategories({required List<CategoryModel> categories})async{
    
    return super.noSuchMethod(
      Invocation.method(#insertCategories,[], {#categories:categories}),
      returnValue: Future.value(
        null,
      ),
      returnValueForMissingStub: Future.value(
        null,
      )
    );
  }
  Future<List<AreaModel>> get areas async{
    
    return super.noSuchMethod(
      Invocation.getter(#areas),
      returnValue: Future.value(
        List<AreaModel>.empty(),
      ),
      returnValueForMissingStub: Future.value(
        List<AreaModel>.empty(),
      )
    );
  }
  Future<void> insertAreas({required List<AreaModel> areas})async{
    
    return super.noSuchMethod(
      Invocation.method(#insertAreas,[], {#areas:areas}),
      returnValue: Future.value(
        null,
      ),
      returnValueForMissingStub: Future.value(
        null,
      )
    );
  }
  Future<List<MealModel>> searchMeal({required String name}) async{
    
    return super.noSuchMethod(
      Invocation.method(#name,[],{#name:name}),
      returnValue: Future.value(
        List<MealModel>.empty(),
      ),
      returnValueForMissingStub: Future.value(
        List<MealModel>.empty(),
      )
    );
  }

  Future<MealModel?> detailMeal({required String id}) async{
    
    return super.noSuchMethod(
      Invocation.method(#detailMeal,[], {#id:id}),
      returnValue: Future.value(
        null,
      ),
      returnValueForMissingStub: Future.value(
        null,
      )
    );
  }

  Future<void> insertMeals({required List<MealModel> meals})async{
    
    return super.noSuchMethod(
      Invocation.method(#insertMeals,[], {#meals:meals}),
      returnValue: Future.value(
        null,
      ),
      returnValueForMissingStub: Future.value(
        null,
      )
    );
  }
}