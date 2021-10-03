import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../entities/meal_entity.dart';
import '../repositories/meal_repository.dart';
class LikeOrUnlikeMealUsecase implements Usecase<RepositoryResponse, LikeOrUnlikeMealUsecaseParams>{
  final MealRepository mealRepository;

  LikeOrUnlikeMealUsecase({
    required this.mealRepository
  });

  @override
  Future<RepositoryResponse> call(LikeOrUnlikeMealUsecaseParams params) async{

    return this.mealRepository.likeOrUnlikeMeal(meal: params.meal);
  }

  
}
class LikeOrUnlikeMealUsecaseParams extends UsecaseParams{
  final MealEntity meal;

  LikeOrUnlikeMealUsecaseParams({required this.meal});
}