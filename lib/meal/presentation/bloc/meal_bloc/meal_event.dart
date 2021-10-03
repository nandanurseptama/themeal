part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();

  @override
  List<Object?> get props => [];
}

class OpenDetailMealEvent extends MealEvent{
  final MealEntity meal;

  OpenDetailMealEvent({required this.meal});

  @override
  List<Object?> get props => [this.meal];
}
class CloseDetailMealEvent extends MealEvent{
  
}

class SearchMealEvent extends MealEvent{
  final String query;

  SearchMealEvent({required this.query});

  @override
  List<Object?> get props => [this.query];
}