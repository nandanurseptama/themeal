import 'package:dio/dio.dart';

import '../../../core/constant/api_endpoint.dart';
import '../../../core/exception/remote_data_source_exception.dart';
import '../models/area_model.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';

/// Meal RemoteDataSource
/// 
/// a class to interact with meal remote data
abstract class MealRemoteDataSource{

  /// get areas data from remote data
  /// 
  /// will return list of AreaModel when success
  /// or throw Exception when fail
  Future<List<AreaModel>> get areas;

  /// get categories data from remote data
  /// 
  /// will return list of CategoryModel when success
  /// or throw Exception when fail
  Future<List<CategoryModel>> get categories;

  /// get detail of meal from remote data
  /// 
  /// filtered by id
  /// if success, will return Single MealModel
  /// or throw Exception when fail
  Future<MealModel?> getMeal({required String id});

  /// get meal data from remote data source
  /// 
  /// filter by meal name
  /// will return list of MealModel when success
  /// or throw Exception when fail
  Future<List<MealModel>> search({required String name});
}
class MealRemoteDataSourceImpl implements MealRemoteDataSource{
  final Dio client;

  MealRemoteDataSourceImpl({
    required this.client
  });
  @override
  Future<List<AreaModel>> get areas async{
    try{
      var response = await client.get(
        ApiEndpoint.areas,
      );
      if(response.statusCode != 200){
        throw response.statusMessage == null ? RemoteDataSourceException.internalError() 
        : throw RemoteDataSourceException(
          reason: response.statusMessage!
        );
      }
      var data = response.data;
      if(data['meals'] == null){
        return List.empty();
      }
      return (data['meals'] as List).map((e){
        return AreaModel.fromJson(
          Map<String,dynamic>.from(e),
        );
      }).toList();
    } on RemoteDataSourceException catch(e){
      throw e;
    }
    catch(e){
      throw RemoteDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> get categories async{
    print(ApiEndpoint.categories);
    try{
      var response = await client.get(
        ApiEndpoint.categories,
      );
      if(response.statusCode != 200){
        throw response.statusMessage == null ? RemoteDataSourceException.internalError() 
        : throw RemoteDataSourceException(
          reason: response.statusMessage!
        );
      }
      print(response.data);
      var data = response.data;
      if(data['categories'] == null){
        return List.empty();
      }
      return (data['categories'] as List).map((e){
        return CategoryModel.fromJson(
          Map<String,dynamic>.from(e),
        );
      }).toList();
    } on RemoteDataSourceException catch(e){
      print(e.reason);
      throw e;
    }
    catch(e){
      throw RemoteDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<MealModel?> getMeal({required String id}) async{
    try{
      var response = await client.get(
        ApiEndpoint.detailMeal(id: id),
      );
      if(response.statusCode != 200){
        throw response.statusMessage == null ? RemoteDataSourceException.internalError() 
        : throw RemoteDataSourceException(
          reason: response.statusMessage!
        );
      }
      var data = response.data;
      if(data['meals'] == null){
        return null;
      }
      var meals = (data['meals'] as List).map((e){
        return MealModel.fromJson(
          Map<String,dynamic>.from(e),
        );
      }).toList();
      return meals.isEmpty ? null : meals.first;
    } on RemoteDataSourceException catch(e){
      throw e;
    }
    catch(e){
      throw RemoteDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<List<MealModel>> search({required String name}) async{
    try{
      var response = await client.get(
        ApiEndpoint.search(name: name),
      );
      if(response.statusCode != 200){
        throw response.statusMessage == null ? RemoteDataSourceException.internalError() 
        : throw RemoteDataSourceException(
          reason: response.statusMessage!
        );
      }
      print(response.data);
      var data = response.data;
      if(data['meals'] == null){
        return List.empty();
      }
      return (data['meals'] as List).map((e){
        return MealModel.fromJson(
          Map<String,dynamic>.from(e),
        );
      }).toList();
    } on RemoteDataSourceException catch(e){
      print(e.reason);
      throw e;
    }
    catch(e){
      print(e.toString());
      throw RemoteDataSourceException(reason: e.toString());
    }
  }
  
}