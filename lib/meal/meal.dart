import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/local_datasource.dart';
import 'data/datasource/remote_datasource.dart';
import 'data/repositories/meal_repository_impl.dart';
import 'domain/repositories/meal_repository.dart';
import 'domain/usecases/get_areas_usecase.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'domain/usecases/get_favorite_usecase.dart';
import 'domain/usecases/like_or_unlike_usecase.dart';
import 'domain/usecases/search_meal_usecase.dart';
import 'presentation/bloc/areas_bloc/areas_bloc.dart';
import 'presentation/bloc/bloc/favorite_bloc.dart';
import 'presentation/bloc/categories_bloc/categories_bloc.dart';
import 'presentation/bloc/meal_bloc/meal_bloc.dart';

class MealModul extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => CategoriesBloc(getCategoryUsecase: i()),export: true),
    Bind.lazySingleton((i) => AreasBloc(getAreasUsecase: i()),export: true),
    Bind.lazySingleton((i) => FavoriteBloc(likeOrUnlikeMealUsecase: i(), getFavoriteMealUSecase: i()),export: true),
    Bind.lazySingleton((i) => MealBloc(searchMealUsecase: i(),favoriteBloc: i()),export: true),
    Bind.lazySingleton((i) => LikeOrUnlikeMealUsecase(mealRepository: i()),export: true),
    Bind.lazySingleton((i) => GetFavoriteMealUSecase(mealRepository: i()),export: true),
    Bind.lazySingleton((i) => SearchMealUsecase(mealRepository: i()),export:true),
    Bind.lazySingleton((i) => GetAreasUsecase(mealRepository:i()),export: true),
    Bind.lazySingleton((i) => GetCategoryUsecase(mealRepository:i()),export: true),
    Bind.lazySingleton<MealRepository>(
      (i)=>MealRepositoryImpl(
        networkInfo: i(), 
        mealLocalDataSource: i(), 
        mealRemoteDataSource: i()
    ),export: true),
    Bind.lazySingleton<MealLocalDataSource>(
      (i)=>MealLocalDataSourceImpl(database: i()),
      export: true
    ),
    Bind.lazySingleton<MealRemoteDataSource>((i) => MealRemoteDataSourceImpl(client: i()),export: true),
  ];

  @override
  List<ModularRoute> get routes => [];
}