
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

import '../../domain/entities/category_entity.dart';

part 'category_model.g.dart';
/// CategoryModel
///
/// a class to modelling Category Meal from remote data source

@JsonSerializable()
class CategoryModel extends CategoryEntity{

  /// id category
  final String idCategory;

  /// category name
  final String strCategory;

  /// category thumbnail
  final String strCategoryThumb;
  
  /// category description
  final String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.strCategoryDescription,
    required this.strCategoryThumb,
    required this.strCategory,
  }) : super(
    idCategory: idCategory,
    strCategory: strCategory,
    strCategoryDescription: strCategoryDescription,
    strCategoryThumb: strCategoryThumb
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}
class CategoryTable extends Table{
  IntColumn get id => integer().autoIncrement()();

  /// id category
  TextColumn get idCategory => text().customConstraint('UNIQUE')();

  /// category name
  TextColumn get strCategory => text()();

  /// category thumbnail
  TextColumn get strCategoryThumb => text()();
  
  /// category description
  TextColumn get strCategoryDescription => text()();

  CategoryModel toModel(){
    return CategoryModel(
      idCategory: idCategory.toString(),
      strCategory: strCategory.toString(),
      strCategoryDescription: strCategoryDescription.toString(),
      strCategoryThumb: strCategoryThumb.toString()
    );
  }
}