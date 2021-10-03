import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../meal/domain/entities/meal_entity.dart';
import '../../meal/presentation/bloc/areas_bloc/areas_bloc.dart';
import '../../meal/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../meal/presentation/bloc/meal_bloc/meal_bloc.dart';
import '../../meal/presentation/screens/detail_meal_screen.dart';
import '../../meal/presentation/screens/explore_screen.dart';
import '../../meal/presentation/screens/favorite_screen.dart';
import '../constant/constant_key.dart';
import 'bottom_navigation_widget.dart';
import 'home_screen.dart';
/// NavigationScreen
///
/// Contain HomeScreen, ExploreScreen & FavoriteScreen
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({ Key? key }) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentScreen = 0;
  MealEntity? meal;
  int exploreScreen = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      bottomNavigationBar: BottomNavigationWidget(
        key: Key(ConstantKey.bottomNavigation),
        currentIndex: currentScreen,
        onSelectedItem: (value) {
          onSelectedNavigationItem(value);
        },
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AreasBloc, AreasState>(
            bloc: Modular.get<AreasBloc>(),
            listener: (context, state) {
              
            },
          ),
          BlocListener<CategoriesBloc, CategoriesState>(
            bloc: Modular.get<CategoriesBloc>(),
            listener: (context, state) {
              
            },
          ),
          BlocListener<MealBloc, MealState>(
            listener: (context, state) {
              
              
            },
          )
        ],
        child: IndexedStack(
          index: currentScreen,
          children: [
            home,
            explore,
            favorite,
          ],
        ),
      )
    );
  }
  void onSelectedNavigationItem(int value){
    setState(() {
      this.currentScreen = value;
    });
  }
  Widget get home{
    return HomeScreen(
      key: Key(ConstantKey.homeScreen),
    );
  }
  Widget get favorite{
    return BlocBuilder<MealBloc, MealState>(
      bloc: Modular.get<MealBloc>(),
      builder: (context, state) {
        if(state.event is OpenDetailMealEvent){
          if(state is LoadedMealState){
            return 
            state.selectedMeal == null ?
            CircularProgressIndicator() :
            DetailMealScreen(meal: state.selectedMeal!);
          }
        }
        return FavoriteScreen(
          key: Key(ConstantKey.favoriteScreen),
        );
      },
    );
  }
  Widget get explore{
    return BlocBuilder<MealBloc, MealState>(
      bloc: Modular.get<MealBloc>(),
      builder: (context, state) {
        if(state.event is OpenDetailMealEvent){
          if(state is LoadedMealState){
            return 
            state.selectedMeal == null ?
            CircularProgressIndicator() :
            DetailMealScreen(meal: state.selectedMeal!);
          }
        }
        return ExploreScreen(
          key: Key(ConstantKey.exploreScreen),
          onSelectedMeal: (meal) {
            setState(() {
              this.meal = meal;
            });
          },
        );
      },
    );
    
  }
}