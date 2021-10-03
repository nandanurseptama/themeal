import 'dart:io';

// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../meal/data/models/area_model.dart';
import '../../meal/data/models/category_model.dart';
import '../../meal/data/models/meal_model.dart';

part 'database.g.dart';

@UseMoor(
  tables: [AreaTable, MealTable, CategoryTable]
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CategoryModel>> get categories async{
    try{
      final query = select(categoryTable);
      var res = await query.get();
      return res.map((e){
        return CategoryModel.fromJson(e.toJson());
      }).toList(growable: true);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<void> insertCategories({required List<CategoryModel> categories})async{
    try{
      return transaction(() async {
        for(var category in categories){
          await into(categoryTable).insert(
            CategoryTableCompanion.insert(
              idCategory: category.idCategory,
              strCategory: category.strCategory,
              strCategoryDescription: category.strCategoryDescription,
              strCategoryThumb: category.strCategoryThumb,
            ),
            onConflict: DoUpdate((old) => CategoryTableCompanion.custom(
              strCategory: Variable(category.strCategory),
              strCategoryDescription: Variable(category.strCategoryDescription),
              strCategoryThumb: Variable(category.strCategory),
            )),
            mode: InsertMode.insertOrReplace
          );
        }
      });
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<List<AreaModel>> get areas async{
    try{
      final query = select(areaTable);
      var res = await query.get();
      return res.map((e){
        return AreaModel.fromJson(e.toJson());
      }).toList(growable: true);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<void> insertAreas({required List<AreaModel> areas})async{
    try{
      return transaction(() async {
        for(var area in areas){
          await into(areaTable).insert(
            AreaTableCompanion.insert(strArea: area.strArea),
            onConflict: DoUpdate((old)=>AreaTableCompanion.custom(
              strArea: Variable(area.strArea),
            )),
            mode: InsertMode.insertOrReplace
          );
        }
      });
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<List<MealModel>> searchMeal({required String name}) async{
    try{
      final query = select(mealTable);
      var res = await query.get();
      return res.map((e){
        return MealModel.fromDB(e.toJson());
      }).toList(growable: true).where((element) => element.strMeal.contains(name)).toList();
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<List<MealModel>> favorites() async{
    try{
      final query = select(mealTable);
      var res = await query.get();
      return res.map((e){
        return MealModel.fromDB(e.toJson());
      }).toList(growable: true).where((element) => element.isFavorite == true).toList();
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<MealModel?> detailMeal({required String id}) async{
    try{
      final query = select(mealTable)
      ..where((tbl) => tbl.idMeal.equals(id));
      var res = await query.getSingle();
      return MealModel.fromDB(res.toJson());
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> insertMeals({required List<MealModel> meals})async{
    try{
      return transaction(() async {
        for(var meal in meals){
          await into(mealTable).insert(
            MealTableCompanion.insert(
              idMeal: meal.idMeal,
              strArea: meal.strArea,
              strCategory: meal.strCategory,
              strTags: Value(meal.strTags),
              strYoutube: meal.strYoutube,
              strMeal: meal.strMeal,
              strImageSource: Value(meal.strImageSource),
              strSource: Value(meal.strSource),
              strInstructions: meal.strInstructions,
              strDrinkAlternate: Value(meal.strDrinkAlternate),
              strIngredient: meal.strIngredient.isEmpty ? Value(null) : Value(meal.strIngredient.join(';')),
              strMeasure: meal.strMeasure.isEmpty ? Value(null) : Value(meal.strMeasure.join(';')),
              strMealThumb: Value(meal.strMealThumb),
              isFavorite: Value(meal.isFavorite),
            ),
            mode: InsertMode.insertOrIgnore,
          );
        }
      });
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<void> updateMeals({required List<MealModel> meals})async{
    try{
      return transaction(() async {
        for(var meal in meals){
          await (update(mealTable).. where((tbl) => tbl.idMeal.equals(meal.idMeal))).write(
            MealTableCompanion(
              strArea: Value(meal.strArea),
              strCategory: Value(meal.strCategory),
              strTags: Value(meal.strTags),
              strYoutube: Value(meal.strYoutube),
              strMeal: Value(meal.strMeal),
              strImageSource: Value(meal.strImageSource),
              strSource: Value(meal.strSource),
              strInstructions: Value(meal.strInstructions),
              strDrinkAlternate: Value(meal.strDrinkAlternate),
              strIngredient: meal.strIngredient.isEmpty ? Value(null) : Value(meal.strIngredient.join(';')),
              strMeasure: meal.strMeasure.isEmpty ? Value(null) : Value(meal.strMeasure.join(';')),
              strMealThumb: Value(meal.strMealThumb),
              isFavorite: Value(meal.isFavorite),
            )
          );
        }
      });
    }catch(e){
      throw Exception(e.toString());
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}