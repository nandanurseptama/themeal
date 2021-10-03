import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../meal/domain/entities/meal_entity.dart';
import '../../../meal/presentation/bloc/bloc/favorite_bloc.dart';
import '../../../meal/presentation/bloc/meal_bloc/meal_bloc.dart';
import '../../constant/constant_key.dart';
import '../image_widget.dart';
import '../preloader_widget.dart';

class FoodPanelWidget extends StatelessWidget {
  const FoodPanelWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(20)
        )
      ),
      child: Container(
        child: bloc(context: context),
      ),
    );
  }
  Widget bloc({required BuildContext context}){
    return BlocBuilder<MealBloc, MealState>(
      bloc: Modular.get<MealBloc>(),
      builder: (context, state) {
        return body(
          meal: state is LoadedMealState && state.meals.isNotEmpty ? state.meals[Random().nextInt(state.meals.length)] : null,
          context: context
        );
      },
    );
  }
  Widget body({required BuildContext context, MealEntity? meal}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cover(url: meal == null ? null : meal.strMealThumb),
        SizedBox(height: ScreenUtil().setHeight(10)),
        title(context: context, name: meal == null ? null : meal.strMeal),
        SizedBox(height: ScreenUtil().setHeight(10)),
        description(context: context, description:  meal == null ? null : meal.strInstructions),
        SizedBox(height: ScreenUtil().setHeight(10)),
        buttonLove(context: context, meal: meal)
      ],
    );
  }
  Widget title({required BuildContext context, String? name}){
    if(name == null){
      return PreloaderWidget(
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setHeight(20),
        key: Key(ConstantKey.foodPanelHomeTitle),
      );
    }
    return Container(
      key: Key(ConstantKey.foodPanelHomeTitle),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        name,
        maxLines: 1,
        textAlign: TextAlign.left,
        style:Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: ScreenUtil().setSp(16)
        ),
      ),
    );
  }
  Widget description({required BuildContext context, String? description}){
    if(description == null){
      return PreloaderWidget(
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setHeight(20),
        key: Key(ConstantKey.foodPanelHomeDesc),
      );
    }
    return Container(
      key: Key(ConstantKey.foodPanelHomeDesc),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        description,
        maxLines: 3,
        textAlign: TextAlign.left,
        style:Theme.of(context).textTheme.caption!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(12)
        ),
      ),
    );
  }
  Widget cover({String? url}){
    if(url == null){
      return PreloaderWidget(
        width: ScreenUtil().setWidth(340),
        height: ScreenUtil().setHeight(160),
        key: Key(ConstantKey.foodPanelHomeImage),
      );
    }
    return ImageWidget.fromAssetOrNetwork(
      key: Key(ConstantKey.foodPanelHomeImage),
      url: url,
      fit: BoxFit.cover,
      height: ScreenUtil().setHeight(160),
      shape: BoxShape.rectangle,
      width: ScreenUtil().setWidth(340),
      radius: BorderRadius.only(
        topLeft: Radius.circular(ScreenUtil().setWidth(10)),
        topRight: Radius.circular(ScreenUtil().setWidth(10))
      )
    );
  }
  Widget buttonLove({required BuildContext context, MealEntity? meal}){
    if(meal == null){
      return PreloaderWidget(
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(50),
        key: Key(ConstantKey.foodPanelHomeButtonLove),
        radius: ScreenUtil().setWidth(10),
      );
    }
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      bloc: Modular.get<FavoriteBloc>(),
      builder: (context, state) {
        return MaterialButton(
          key: Key(ConstantKey.foodPanelHomeButtonLove),
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ScreenUtil().setWidth(20))
            )
          ),
          color: Theme.of(context).buttonColor,
          child: Icon(
            state.meals.indexWhere((element) => element.idMeal == meal.idMeal) != -1 ?  Icons.favorite : Icons.favorite_outline,
            color: Theme.of(context).iconTheme.color
          ),
          minWidth: ScreenUtil().setWidth(50),
          height: ScreenUtil().setHeight(50),
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setHeight(10)
          ),
          onPressed: () {
            Modular.get<FavoriteBloc>().add(LikeOrUnlikeEvent(meal: meal));
          },
        );
      },
    );
  }
}