import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/response.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../domain/usecases/search_meal_usecase.dart';
import '../bloc/favorite_bloc.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  final SearchMealUsecase searchMealUsecase;
  final FavoriteBloc favoriteBloc;

  MealBloc({
    required this.searchMealUsecase,
    required this.favoriteBloc
  }) : super(MealInitial()) {
    on<SearchMealEvent>(searchMealEvent);
    on<OpenDetailMealEvent>(openDetailMealEvent);
    on<CloseDetailMealEvent>(closeDetailMealEvent);
  }
  Future<void> searchMealEvent(SearchMealEvent event, Emitter emit)async{
    var prevState = state;
    emit(OnLoadMealState(event: event,meals: prevState.meals));
    var response = await searchMealUsecase(SearchMealUsecaseParams(name: event.query));
    if(response is SuccessResponse){
      var meals = response.data as List<MealEntity>;
      emit(
        LoadedMealState(
          event: event, 
          meals: meals,
          selectedMeal: prevState.selectedMeal
        )
      );
    } else{
      emit(FailureMealState(event: event, meals: prevState.meals, message: response.message,selectedMeal: prevState.selectedMeal));
    }
  }
  Future<void> openDetailMealEvent(OpenDetailMealEvent event , Emitter emit)async{
    var prevState = state;
    emit(OnLoadMealState(event: event,meals: prevState.meals));
    emit(LoadedMealState(event: event, meals: prevState.meals,selectedMeal: event.meal));
  }
  Future<void> closeDetailMealEvent(CloseDetailMealEvent event , Emitter emit)async{
    var prevState = state;
    emit(OnLoadMealState(event: event,meals: prevState.meals));
    emit(LoadedMealState(event: event, meals: prevState.meals,selectedMeal: null));
  }
  bool isFavorite({required MealEntity meal}){
    return favoriteBloc.state.meals.indexWhere((element) => meal.idMeal == element.idMeal) != -1;
  }
}
