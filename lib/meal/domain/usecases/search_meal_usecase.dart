import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../repositories/meal_repository.dart';

class SearchMealUsecase implements Usecase<RepositoryResponse, SearchMealUsecaseParams>{
  final MealRepository mealRepository;

  SearchMealUsecase({required this.mealRepository});

  @override
  Future<RepositoryResponse> call(SearchMealUsecaseParams params) async{

    return await this.mealRepository.search(name: params.name);
  }

  
}
class SearchMealUsecaseParams extends UsecaseParams{
  final String name;

  SearchMealUsecaseParams({required this.name});
  
}