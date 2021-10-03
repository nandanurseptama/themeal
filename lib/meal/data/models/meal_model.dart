
import 'dart:convert';

import 'package:moor/moor.dart';

import '../../../core/constant/constant_ui.dart';
import '../../domain/entities/meal_entity.dart';
/// MealModel
///
/// a class to interact with remote data
class MealModel extends MealEntity{
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

  /// meal tags
  final String? strTags;

  /// tutorial video about how to cook the meal
  final String strYoutube;

  /// list of ingredient
  final List<String?> strIngredient;
  
  /// meal thumb
  final String strMealThumb;

  /// list of ingredient measure
  final List<String?> strMeasure;

  /// author
  final String? strSource;

  /// image source
  final String? strImageSource;

  /// isFavorite
  final bool isFavorite;

  MealModel({
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
  }) : super(
    idMeal: idMeal,
    strArea: strArea,
    strCategory: strCategory,
    strIngredient: strIngredient,
    strInstructions: strInstructions,
    strMeal: strMeal,
    strMeasure: strMeasure,
    strTags: strTags,
    strYoutube: strYoutube,
    strDrinkAlternate: strDrinkAlternate,
    strImageSource: strImageSource,
    strSource: strSource,
    strMealThumb: strMealThumb,
    isFavorite: isFavorite,
  );  
  factory MealModel.fromJson(Map<String, dynamic> json){
    return MealModel(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strDrinkAlternate: json['strDrinkAlternate'] as String?,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions'] as String,
      strTags: json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String,
      strMealThumb: json['strMealThumb'] == null ? ConstantUi.MEAL_NULL_IMAGE : json['strMealThumb'] as String,
      strSource: json['strSource'] as String?,
      strImageSource: json['strImageSource'] as String?,
      strIngredient: json.entries.map((e){
        if(e.key.contains('strIngredient')){
          return e.value as String?;
        }
        return null;
      }).toList(),
      strMeasure: json.entries.map((e){
        if(e.key.contains('strMeasure')){
          return e.value as String?;
        }
        return null;
      }).toList(),
    );
  }
  factory MealModel.fromDB(Map<String, dynamic> json){
    return MealModel(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strDrinkAlternate: json['strDrinkAlternate'] as String?,
      strCategory: json['strCategory'] as String,
      strArea: json['strArea'] as String,
      strInstructions: json['strInstructions'] as String,
      strTags: json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String,
      strIngredient: json['strIngredient']  == null ? List.empty() :
      (json['strIngredient'] as String).split(';'),
      strMeasure: json['strMeasure']  == null ? List.empty() :
      (json['strMeasure'] as String).split(';'),
      strSource: json['strSource'] as String?,
      strImageSource: json['strImageSource'] as String?,
      strMealThumb: json['strMealThumb'] == null ? ConstantUi.MEAL_NULL_IMAGE : json['strMealThumb'] as String,
      isFavorite: json['isFavorite'] == null ? false : json['isFavorite'] as bool,
    );
  }
  MealModel copyWith({
    String? idMeal,
    String? strMeal,
    String? strDrinkAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strTags,
    String? strYoutube,
    List<String?>? strIngredient,
    List<String?>? strMeasure,
    String? strSource,
    String? strImageSource,
    String? strMealThumb,
    bool? isFavorite = false,
  }){
    return MealModel(
      idMeal: idMeal?? this.idMeal,
      strArea: strArea ?? this.strArea,
      strDrinkAlternate: strDrinkAlternate ?? this.strDrinkAlternate,
      strCategory: strCategory ?? this.strCategory,
      strMeal: strMeal ?? this.strMeal,
      strYoutube: strYoutube ?? this.strYoutube,
      strInstructions: strInstructions ?? this.strInstructions,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strSource: strSource ?? this.strSource,
      strTags: strTags ?? this.strTags,
      isFavorite: isFavorite ?? this.isFavorite,
      strImageSource: strImageSource ?? this.strImageSource,
      strIngredient: strIngredient ?? this.strIngredient,
      strMeasure: strMeasure ?? this.strMeasure,
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'idMeal': this.idMeal,
      'strMeal': this.strMeal,
      'strDrinkAlternate': this.strDrinkAlternate,
      'strCategory': this.strCategory,
      'strArea': this.strArea,
      'strInstructions': this.strInstructions,
      'strTags': this.strTags,
      'strYoutube': this.strYoutube,
      'strIngredient': this.strIngredient,
      'strMeasure': this.strMeasure,
      'strSource': this.strSource,
      'strImageSource': this.strImageSource,
      'strMealThumb': this.strMealThumb,
      'isFavorite': this.isFavorite,
    };
  }
}
/// MealTable
///
/// a class to interact with local data
class MealTable extends Table{
  IntColumn get id => integer().autoIncrement()();

  /// id meal
  TextColumn get idMeal => text().customConstraint('UNIQUE')();

  /// meal name
  TextColumn get strMeal => text()();

  /// drink alternate
  TextColumn get strDrinkAlternate => text().nullable()();

  /// meal category
  TextColumn get strCategory => text()();

  /// meal area
  TextColumn get strArea => text()();

  /// meal thumb
  TextColumn get strMealThumb => text().nullable()();

  /// instruction to cook
  TextColumn get strInstructions => text()();

  /// meal tags
  TextColumn get strTags => text().nullable()();

  /// tutorial video about how to cook the meal
  TextColumn get strYoutube => text()();

  /// list of ingredient
  TextColumn get strIngredient =>text().nullable()();

  /// list of ingredient measure
  TextColumn get strMeasure => text().nullable()();

  /// author
  TextColumn get strSource => text().nullable()();

  /// image source
  TextColumn get strImageSource => text().nullable()();
  /// is favorite
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  MealModel toModel(){
    return MealModel(
      idMeal: idMeal.toString(),
      strArea: strArea.toString(),
      strCategory: strCategory.toString(),
      strIngredient: json.decode(strIngredient.toString()),
      strInstructions: strInstructions.toString(),
      strMeal: strMeal.toString(),
      strMeasure: json.decode(strMeasure.toString()),
      strTags: strTags.toString(),
      strYoutube: strYoutube.toString(),
      strDrinkAlternate: strDrinkAlternate.toString(),
      strImageSource: strImageSource.toString(),
      strSource: strSource.toString(),
      strMealThumb: strMealThumb.toString(),
      isFavorite: isFavorite.toString() == 'true',
    );
  }
}