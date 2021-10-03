part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  final MealEntity? selectedMeal;
  final List<MealEntity> meals;
  final String? message;
  final MealEvent? event;
  
  const MealState({
    this.event,
    required this.meals,
    this.selectedMeal,
    this.message
  });
  
  @override
  List<Object?> get props => [
    this.event,
    this.meals,
    this.selectedMeal,
    this.message
  ];
}

class MealInitial extends MealState {

  MealInitial() : super(meals: List<MealEntity>.empty(),message: null, selectedMeal: null, event: null);
}
class OnLoadMealState extends MealState{

  OnLoadMealState({
    required MealEvent event,
    List<MealEntity>? meals
  }) : super(meals: meals ?? List<MealEntity>.empty(),event: event);
}
class LoadedMealState extends MealState{

  LoadedMealState({
    required MealEvent event,
    required List<MealEntity> meals,
    MealEntity? selectedMeal,
  }) : super(meals: meals, event: event,selectedMeal: selectedMeal);
}
class FailureMealState extends MealState{

  FailureMealState({
    required MealEvent event,
    required List<MealEntity>? meals,
    MealEntity? selectedMeal,
    required String message,
  }) : super(meals: meals ?? List<MealEntity>.empty(), event: event,selectedMeal: selectedMeal, message: message);
}