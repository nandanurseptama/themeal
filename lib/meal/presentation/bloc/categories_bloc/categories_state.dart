part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  final List<CategoryEntity> categories;
  final String? message;
  final CategoriesEvent? event;
  CategoriesState({
    required this.categories,
    this.message,
    this.event
  });
  
  @override
  List<Object?> get props => [
    this.categories,
    this.message,
    this.event,
  ];
}

class CategoriesInitial extends CategoriesState {
  CategoriesInitial() : super(categories: List<CategoryEntity>.empty());
}
class OnLoadCategories extends CategoriesState {
  final CategoriesEvent event;

  OnLoadCategories({
    List<CategoryEntity>? categories,
    required this.event
  }) : super(categories: categories ?? List<CategoryEntity>.empty(), event: event);
}
class LoadedCategoriesState extends CategoriesState {

  final List<CategoryEntity> categories;
  final CategoriesEvent event;

  LoadedCategoriesState({
    required this.categories,
    required this.event
  }) : super(categories: categories, event: event);
}
class FailureCategoriesState extends CategoriesState{

  final String message;
  final CategoriesEvent event;

  FailureCategoriesState({
    List<CategoryEntity>? categories,
    required this.event,
    required this.message,
  }) : super(categories: categories ?? List<CategoryEntity>.empty(), event: event, message: message);
}