import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../meal/presentation/bloc/areas_bloc/areas_bloc.dart';
import '../../meal/presentation/bloc/bloc/favorite_bloc.dart';
import '../../meal/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../meal/presentation/bloc/meal_bloc/meal_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Modular.get<CategoriesBloc>().add(LoadCategoriesEvent());
    Modular.get<AreasBloc>().add(LoadAreaEvent());
    Modular.get<MealBloc>().add(SearchMealEvent(query: 'a'));
    Modular.get<FavoriteBloc>().add(GetFavoriteEvent());
    Modular.to.navigate('/home');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'The Meal DB',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: ScreenUtil().setSp(24),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}