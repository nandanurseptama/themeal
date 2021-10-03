import '../../../core/utils/response.dart';
import '../../../core/utils/usecase.dart';
import '../repositories/meal_repository.dart';

class GetAreasUsecase implements Usecase<RepositoryResponse, NoParams>{
  final MealRepository mealRepository;

  GetAreasUsecase({required this.mealRepository});

  @override
  Future<RepositoryResponse> call(NoParams params) async{

    return await mealRepository.areas;
  }
}