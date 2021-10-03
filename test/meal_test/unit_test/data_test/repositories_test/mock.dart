import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/network_info.dart';
import 'package:themeal/meal/data/datasource/local_datasource.dart';
import 'package:themeal/meal/data/datasource/remote_datasource.dart';
import 'package:themeal/meal/data/models/area_model.dart';
import 'package:themeal/meal/data/models/category_model.dart';
import 'package:themeal/meal/data/models/meal_model.dart';
class MockNetworkInfo extends Mock implements NetworkInfo{

  Future<bool> get isConnected{

    return super.noSuchMethod(
      Invocation.getter(#isConnected),
      returnValue: Future.value(true),
      returnValueForMissingStub: Future.value(true)
    );
  }  
}
class MockMealLocalDataSource extends Mock implements MealLocalDataSource{
  /// get areas data from local data
  /// 
  /// will return list of AreaModel when success
  /// or throw Exception when fail
  Future<List<AreaModel>> get areas{

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

  /// set areas data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setAreas({required List<AreaModel> areas}){

    return super.noSuchMethod(
      Invocation.method(#setAreas,[],{#areas:areas}),
      returnValue: Future.value(
        null
      ),
      returnValueForMissingStub: Future.value(
        null
      )
    ); 
  }

  /// get categories data from local data
  /// 
  /// will return list of CategoryModel when success
  /// or throw Exception when fail
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

  /// set categoires data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setCategories({required List<CategoryModel> categories}){

    return super.noSuchMethod(
      Invocation.method(#setCategories,[],{#categories:categories}),
      returnValue: Future.value(
        null
      ),
      returnValueForMissingStub: Future.value(
        null
      )
    ); 
  }

  /// get detail of meal from local data
  /// 
  /// filtered by id
  /// if success, will return Single MealModel
  /// or throw Exception when fail
  Future<MealModel?> getMeal({required String id}){

    return super.noSuchMethod(
      Invocation.method(#getMeal,[],{#id:id}),
      returnValue: Future.value(
        null
      ),
      returnValueForMissingStub: Future.value(
        null
      )
    ); 
  }

  /// set meal data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setMeal({required MealModel meal}){

    return super.noSuchMethod(
      Invocation.method(#setMeal,[],{#meal:meal}),
      returnValue: Future.value(
        null
      ),
      returnValueForMissingStub: Future.value(
        null
      )
    ); 
  }


  /// get meal data from local data source
  /// 
  /// filter by meal name
  /// will return list of MealModel when success
  /// or throw Exception when fail
  Future<List<MealModel>> search({required String name}){

    return super.noSuchMethod(
      Invocation.method(#search,[],{#name:name}),
      returnValue: Future.value(
        List<MealModel>.empty(),
      ),
      returnValueForMissingStub: Future.value(
        List<MealModel>.empty(),
      )
    ); 
  }
}
class MockMealRemoteDataSource extends Mock implements MealRemoteDataSource{

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

  /// get categories data from remote data
  /// 
  /// will return list of CategoryModel when success
  /// or throw Exception when fail
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

  /// get detail of meal from remote data
  /// 
  /// filtered by id
  /// if success, will return Single MealModel
  /// or throw Exception when fail
  Future<MealModel?> getMeal({required String id}){

    return super.noSuchMethod(
      Invocation.method(#getMeal,[],{#id:id}),
      returnValue: Future.value(
        null
      ),
      returnValueForMissingStub: Future.value(
        null
      )
    ); 
  }

  /// get meal data from remote data source
  /// 
  /// filter by meal name
  /// will return list of MealModel when success
  /// or throw Exception when fail
  Future<List<MealModel>> search({required String name}){

    return super.noSuchMethod(
      Invocation.method(#search,[],{#name:name}),
      returnValue: Future.value(
        List<MealModel>.empty(),
      ),
      returnValueForMissingStub: Future.value(
        List<MealModel>.empty(),
      )
    ); 
  }
}