import 'package:equatable/equatable.dart';

import '../../../core/constant/constant_ui.dart';
import '../../data/models/meal_model.dart';

/// MealEntity
///
/// a class to acomadate Meal data
class MealEntity extends Equatable{
  /// id meal
  final String idMeal;

  /// meal name
  final String strMeal;

  /// drink alternate
  final String? strDrinkAlternate;

  /// meal category
  final String strCategory;

  /// meal area
  final String strArea;

  /// instruction to cook
  final String strInstructions;
  
  /// meal thumb
  final String strMealThumb;
  /// meal tags
  final String? strTags;

  /// tutorial video about how to cook the meal
  final String strYoutube;

  /// list of ingredient
  final List<String?> strIngredient;

  /// list of ingredient measure
  final List<String?> strMeasure;

  /// author
  final String? strSource;

  /// image source
  final String? strImageSource;

  /// isFavorite
  final bool isFavorite;

  MealEntity({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    this.strTags,
    required this.strYoutube,
    required this.strIngredient,
    required this.strMeasure,
    this.strSource,
    this.strImageSource,
    this.strMealThumb = ConstantUi.MEAL_NULL_IMAGE,
    this.isFavorite = false,
  });
  
  @override
  List<Object?> get props => [
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strTags,
    this.strYoutube,
    this.strIngredient,
    this.strMeasure,
    this.strSource,
    this.strImageSource,
    this.strMealThumb,
    this.isFavorite,
  ];
  MealModel toModel(){
    return MealModel(
      idMeal: idMeal, 
      strMeal: strMeal, 
      strCategory: strCategory, 
      strArea: strArea, 
      strInstructions: strInstructions, 
      strYoutube: strYoutube, 
      strIngredient: strIngredient, 
      strMeasure: strMeasure,
      isFavorite: isFavorite,
      strImageSource: strImageSource,
      strMealThumb: strMealThumb,
      strDrinkAlternate: strDrinkAlternate,
      strSource: strSource,
      strTags: strTags,
    );
  }
}