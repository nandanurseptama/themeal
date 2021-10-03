import 'package:equatable/equatable.dart';

/// CategoryEntity
///
/// a class to acomadate Category Meal data
class CategoryEntity extends Equatable{

  /// id category
  final String idCategory;

  /// category name
  final String strCategory;

  /// category thumbnail
  final String strCategoryThumb;
  
  /// category description
  final String strCategoryDescription;

  CategoryEntity({
    required this.idCategory,
    required this.strCategoryDescription,
    required this.strCategoryThumb,
    required this.strCategory,
  });

  @override
  List<Object?> get props => [
    this.idCategory,
    this.strCategoryDescription,
    this.strCategoryThumb,
    this.strCategory,
  ];

  

}