import '../../../core/constant/lang.dart';
import '../../../core/exception/local_data_exception.dart';
import '../../../core/exception/remote_data_source_exception.dart';
import '../../../core/utils/network_info.dart';
import '../../../core/utils/response.dart';
import '../../domain/entities/meal_entity.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';

class MealRepositoryImpl implements MealRepository{
  final NetworkInfo networkInfo;
  final MealRemoteDataSource mealRemoteDataSource;
  final MealLocalDataSource mealLocalDataSource;

  MealRepositoryImpl({
    required this.networkInfo,
    required this.mealLocalDataSource,
    required this.mealRemoteDataSource,
  });
  
  @override
  Future<RepositoryResponse> get areas async{
    try{
      if(!await this.networkInfo.isConnected){
        var result = await mealLocalDataSource.areas;
        return SuccessResponse(data: result);
      }
      var result = await this.mealRemoteDataSource.areas;
      await this.mealLocalDataSource.setAreas(areas: result);
      return SuccessResponse(data: result);
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetAreaData, reason: e.reason);
      } else if(e is RemoteDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetAreaData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }

  }

  @override
  Future<RepositoryResponse> get categories async{
    try{
      var isConnected = await this.networkInfo.isConnected;
      print('isConnected $isConnected');
      if(!isConnected){
        var result = await mealLocalDataSource.categories;
        return SuccessResponse(data: result);
      }
      var result = await this.mealRemoteDataSource.categories;
      await this.mealLocalDataSource.setCategories(categories: result);
      return SuccessResponse(data: result);
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetCategoryData, reason: e.reason);
      } else if(e is RemoteDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetCategoryData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }
  }

  @override
  Future<RepositoryResponse> getMeal({required String id}) async{
    try{
      if(!await this.networkInfo.isConnected){
        var result = await mealLocalDataSource.getMeal(id: id);
        return SuccessResponse(data: result);
      }
      var result = await this.mealRemoteDataSource.getMeal(id: id);
      if(result != null){
        await this.mealLocalDataSource.setMeal(meal: result);
      }
      return SuccessResponse(data: result);
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetMealData, reason: e.reason);
      } else if(e is RemoteDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetMealData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }
  }

  @override
  Future<RepositoryResponse> search({required String name}) async{
    try{
      if(!await this.networkInfo.isConnected){
        var result = await mealLocalDataSource.search(name: name);
        return SuccessResponse(data: result);
      }
      var result = await this.mealRemoteDataSource.search(name: name);
      for(var m in result){
        await this.mealLocalDataSource.setMeal(meal: m);
      }
      return SuccessResponse(data: result);
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetSearchResultMealData, reason: e.reason);
      } else if(e is RemoteDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetSearchResultMealData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }
  }

  @override
  Future<RepositoryResponse> getFavoriteMeal() async{
    try{
      var result = await mealLocalDataSource.getFavoriteMeal();
      return SuccessResponse(data: result);
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetSearchResultMealData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }
  }

  @override
  Future<RepositoryResponse> likeOrUnlikeMeal({required MealEntity meal}) async{
    try{
      var model = meal.toModel();
      await mealLocalDataSource.likeOrUnlikeMeal(
        meal: model
      );
      print(model.strMealThumb);
      return SuccessResponse(data: model.copyWith(isFavorite: !model.isFavorite));
    }catch(e){
      if(e is LocalDataSourceException){
        print('Error : ${e.reason}');
        return FailureResponse(message: AppLang.cantGetSearchResultMealData, reason: e.reason);
      }
      print('Error : ${e.toString()}');
      return FailureResponse.internalError();
    }
  }
  
}