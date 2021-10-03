import '../../../core/exception/local_data_exception.dart';
import '../../../core/utils/database.dart';
import '../models/area_model.dart';
import '../models/category_model.dart';
import '../models/meal_model.dart';

/// MealLocalDataSource
/// 
/// a class to interact with meal local data
abstract class MealLocalDataSource{
  /// get areas data from local data
  /// 
  /// will return list of AreaModel when success
  /// or throw Exception when fail
  Future<List<AreaModel>> get areas;

  /// set areas data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setAreas({required List<AreaModel> areas});

  /// get categories data from local data
  /// 
  /// will return list of CategoryModel when success
  /// or throw Exception when fail
  Future<List<CategoryModel>> get categories;

  /// set categoires data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setCategories({required List<CategoryModel> categories});

  /// get detail of meal from local data
  /// 
  /// filtered by id
  /// if success, will return Single MealModel
  /// or throw Exception when fail
  Future<MealModel?> getMeal({required String id});

  /// set meal data to local data source
  /// 
  /// throw Exception when saving fail
  Future<void> setMeal({required MealModel meal});


  /// get meal data from local data source
  /// 
  /// filter by meal name
  /// will return list of MealModel when success
  /// or throw Exception when fail
  Future<List<MealModel>> search({required String name});

  /// get favorite meal from local data
  /// 
  /// will return list of MealModel when success
  /// or throw Exception when fail
  Future<List<MealModel>> getFavoriteMeal();

  /// like or unlike meal
  /// 
  /// will return null
  /// or throw Exception when fail
  Future<void> likeOrUnlikeMeal({required MealModel meal});
}
class MealLocalDataSourceImpl implements MealLocalDataSource{
  final AppDb database;

  MealLocalDataSourceImpl({required this.database});

  @override
  Future<List<AreaModel>> get areas async{
    try{

      return await this.database.areas;
    }catch(e){
      throw LocalDataSourceException.fromException(exception: e as Exception);
    }
  }

  @override
  Future<List<CategoryModel>> get categories async{
    try{

      return await this.database.categories;
    }catch(e){
      throw LocalDataSourceException.fromException(exception: e as Exception);
    }
  }

  @override
  Future<MealModel?> getMeal({required String id}) async{
    try{

      return await this.database.detailMeal(id: id);
    }catch(e){
      throw LocalDataSourceException.fromException(exception: e as Exception);
    }
  }

  @override
  Future<List<MealModel>> search({required String name}) async{
   try{

      return await this.database.searchMeal(name: name);
    }catch(e){
      throw LocalDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<void> setAreas({required List<AreaModel> areas}) async{
    try{

      return await this.database.insertAreas(areas: areas);
    }catch(e){
      throw LocalDataSourceException.fromException(exception: e as Exception);
    }
  }

  @override
  Future<void> setCategories({required List<CategoryModel> categories}) async{
    try{
      
      return await this.database.insertCategories(categories: categories);
    }catch(e){
      throw LocalDataSourceException.fromException(exception: e as Exception);
    }
  }

  @override
  Future<void> setMeal({required MealModel meal}) async{
    
    try{
      
      return await this.database.insertMeals(meals: [meal]);
    }catch(e){
      throw LocalDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<List<MealModel>> getFavoriteMeal() async{
    try{

      return await this.database.favorites();
    }catch(e){
      throw LocalDataSourceException(reason: e.toString());
    }
  }

  @override
  Future<void> likeOrUnlikeMeal({required MealModel meal}) async{

    try{

      return await this.database.updateMeals(
        meals: [
          meal.copyWith(
            isFavorite: !meal.isFavorite
          )
        ]
      );
    }catch(e){
      throw LocalDataSourceException(reason: e.toString());
    }
  }
  
}