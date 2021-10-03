import '../../../core/utils/response.dart';
import '../entities/meal_entity.dart';

abstract class MealRepository{
  
  /// get all categories
  Future<RepositoryResponse> get categories;

  /// get all areas
  Future<RepositoryResponse> get areas;

  /// search meal by meal name
  Future<RepositoryResponse> search({required String name});

  /// get meal detail
  Future<RepositoryResponse> getMeal({required String id});

  /// get favorite
  Future<RepositoryResponse> getFavoriteMeal();

  /// like or unlike favorite
  Future<RepositoryResponse> likeOrUnlikeMeal({required MealEntity meal});
}