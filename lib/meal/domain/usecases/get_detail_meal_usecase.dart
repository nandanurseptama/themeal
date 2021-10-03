import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../repositories/meal_repository.dart';

class GetDetailMealUsecase implements Usecase<RepositoryResponse, GetDetailMealUsecaseParams>{
  final MealRepository mealRepository;

  GetDetailMealUsecase({
    required this.mealRepository,
  });

  @override
  Future<RepositoryResponse> call(GetDetailMealUsecaseParams params) async{
    return await this.mealRepository.getMeal(id: params.id);
  }
}
class GetDetailMealUsecaseParams extends UsecaseParams{
  final String id;

  GetDetailMealUsecaseParams({required this.id});
}