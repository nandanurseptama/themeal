import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../repositories/meal_repository.dart';

class GetFavoriteMealUSecase implements Usecase<RepositoryResponse, NoParams>{

  final MealRepository mealRepository;

  GetFavoriteMealUSecase({
    required this.mealRepository
  });

  @override
  Future<RepositoryResponse> call(NoParams params) async{
    return await this.mealRepository.getFavoriteMeal();
  }
}