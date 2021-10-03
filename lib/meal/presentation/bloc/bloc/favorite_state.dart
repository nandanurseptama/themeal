part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  final List<MealEntity> meals;
  final String? message;
  final FavoriteEvent? event;
  const FavoriteState({
    required this.meals,
    this.message,
    this.event
  });
  
  @override
  List<Object?> get props => [
    this.meals,
    this.message,
    this.event,
  ];
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(meals: List<MealEntity>.empty());
}
class OnLoadFavoriteMealState extends FavoriteState{
  final FavoriteEvent event;
  OnLoadFavoriteMealState({required this.event,
    List<MealEntity>? meals}) : super(meals: meals ??List<MealEntity>.empty(),event: event);
}
class LoadedFavoriteMealState extends  FavoriteState{
  final List<MealEntity> meals;
  final FavoriteEvent event;

  LoadedFavoriteMealState({required this.meals, required this.event}) : super(meals: meals,event: event);
}
class FailureFavoriteMealState extends FavoriteState{
  final String message;
  final FavoriteEvent event;
  FailureFavoriteMealState({
    required this.event,
    required this.message,
    List<MealEntity>? meals
  }) : super(meals: meals ?? List<MealEntity>.empty(),event: event, message: message);
}