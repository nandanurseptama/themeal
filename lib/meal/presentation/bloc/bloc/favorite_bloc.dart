import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/response.dart';
import '../../../../core/utils/usecase.dart';
import '../../../domain/entities/meal_entity.dart';
import '../../../domain/usecases/get_favorite_usecase.dart';
import '../../../domain/usecases/like_or_unlike_usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final LikeOrUnlikeMealUsecase likeOrUnlikeMealUsecase;
  final GetFavoriteMealUSecase getFavoriteMealUSecase;
  FavoriteBloc({
    required this.likeOrUnlikeMealUsecase,
    required this.getFavoriteMealUSecase,
  }) : super(FavoriteInitial()) {
    on<GetFavoriteEvent>(getFavoriteMealEvent);
    on<LikeOrUnlikeEvent>(likeOrUnlikeMeal);
  }
  Future<void> getFavoriteMealEvent(GetFavoriteEvent event, Emitter emit)async{
    var prevState = state;
    emit(OnLoadFavoriteMealState(event: event,meals: prevState.meals));
    var response = await getFavoriteMealUSecase(NoParams());
    if(response is SuccessResponse){
      emit(LoadedFavoriteMealState(meals: response.data as List<MealEntity>, event: event));
    } else{
      emit(FailureFavoriteMealState(event: event, message: response.message,meals: prevState.meals));
    }
  }
  Future<void> likeOrUnlikeMeal(LikeOrUnlikeEvent event, Emitter emit)async{
    var prevState = state;
    emit(OnLoadFavoriteMealState(event: event,meals: prevState.meals));
    var response = await likeOrUnlikeMealUsecase(LikeOrUnlikeMealUsecaseParams(meal: event.meal));
    if(response is SuccessResponse){
      var newMeal = prevState.meals.toList(growable: true);
      if((response.data as MealEntity).isFavorite == true){
        var index = prevState.meals.indexWhere((element) => element.idMeal == event.meal.idMeal);
        if(index == -1){
          newMeal.add(response.data as MealEntity);
        } else{
          newMeal[index] = response.data as MealEntity;
        }
      } 
      else if((response.data as MealEntity).isFavorite == false){
        var index = prevState.meals.indexWhere((element) => element.idMeal == event.meal.idMeal);
        if(index != -1){
          newMeal.removeAt(index);
        }
      }
      emit(LoadedFavoriteMealState(meals: newMeal, event: event));
    } else{
      emit(FailureFavoriteMealState(event: event, message: response.message,meals: prevState.meals));
    }
  }
  bool isFavorite({required MealEntity meal}){
    return state.meals.indexWhere((element) => meal.idMeal == element.idMeal) != -1;
  }
}
