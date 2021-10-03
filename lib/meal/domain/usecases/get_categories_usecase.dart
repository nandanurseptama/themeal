import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../repositories/meal_repository.dart';

class GetCategoryUsecase implements Usecase<RepositoryResponse, NoParams>{
  final MealRepository mealRepository;

  GetCategoryUsecase({required this.mealRepository});

  @override
  Future<RepositoryResponse> call(NoParams params) async{
    
    return await this.mealRepository.categories;
  }

  
}