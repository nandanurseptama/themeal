import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constant/constant_ui.dart';
import '../meal/presentation/bloc/areas_bloc/areas_bloc.dart';
import '../meal/presentation/bloc/bloc/favorite_bloc.dart';
import '../meal/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../meal/presentation/bloc/meal_bloc/meal_bloc.dart';
class AppWidget extends StatelessWidget {
  final Widget? child;
  const AppWidget({ Key? key, this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ??
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Modular.get<CategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => Modular.get<AreasBloc>(),
        ),
        BlocProvider(
          create: (context) => Modular.get<MealBloc>(),
        ),
        BlocProvider(
          create: (context) => Modular.get<FavoriteBloc>(),
        )
      ],
      child: ScreenUtilInit(
        builder: () {
          return  MaterialApp(
            title: 'The Meal',
            theme: ConstantUi.lightTheme,
          ).modular();
        },
      )
    );
  }
}