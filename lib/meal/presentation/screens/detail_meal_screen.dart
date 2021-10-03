import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/image_widget.dart';
import '../../domain/entities/meal_entity.dart';
import '../bloc/bloc/favorite_bloc.dart';
import '../bloc/meal_bloc/meal_bloc.dart';

class DetailMealScreen extends StatefulWidget {
  final MealEntity meal;
  const DetailMealScreen({ Key? key, required this.meal }) : super(key: key);

  @override
  _DetailMealScreenState createState() => _DetailMealScreenState();
}

class _DetailMealScreenState extends State<DetailMealScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Modular.get<MealBloc>().add(CloseDetailMealEvent());
        return Future.value(false);
      },
      child: Container(
        child: body,
      ),
    );
  }
  Widget get body{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        stack,
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        mealName,
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        instructionText,
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        instruction,
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        ingridientsText,
        SizedBox(
          height: ScreenUtil().setHeight(10),
        ),
        ingridients
      ],
    );
  }
  Widget get stack{
    return Container(
      height: ScreenUtil().setHeight(300),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: imageCover,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: ScreenUtil().setHeight(300),
              width: ScreenUtil().screenWidth,
              color: Colors.black.withOpacity(0.5)
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(10),
            left: ScreenUtil().setWidth(5),
            child: btnBack,
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(5),
            right: ScreenUtil().setWidth(5),
            child: btnLove,
          ),
        ],
      ),
    );
  }
  Widget get imageCover{
    return ImageWidget.fromAssetOrNetwork(
      url: widget.meal.strMealThumb,
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().screenWidth,
      fit: BoxFit.cover,
      shape: BoxShape.rectangle,
    );
  }
  Widget get btnLove{
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      bloc: Modular.get<FavoriteBloc>(),
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state.meals.indexWhere((element) => element.idMeal == widget.meal.idMeal) != -1 ? Icons.favorite : Icons.favorite_outline,
            color: widget.meal.isFavorite ? Colors.red : Colors.white
          ),
          onPressed: () {
            Modular.get<FavoriteBloc>().add(LikeOrUnlikeEvent(meal: widget.meal));
          },
        );
      },
    );
  }
  Widget get btnBack{
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        Modular.get<MealBloc>().add(CloseDetailMealEvent());
      },
    );
  }
  Widget get mealName{
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        widget.meal.strMeal,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: ScreenUtil().setSp(24),
        ),
      ),
    );
  }
  Widget get instructionText{
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        'Instructions',
        style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
          fontSize: ScreenUtil().setSp(16),
        ),
      ),
    );
  }
  Widget get instruction{
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Text(
            widget.meal.strInstructions,
            style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
              fontSize: ScreenUtil().setSp(12),
            ),
          ),
        ),
      ),
    );
  }
  Widget get ingridientsText{
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        'Ingredient',
        style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
          fontSize: ScreenUtil().setSp(16),
        ),
      ),
    );
  }
  Widget get ingridients{
    var strIngredient = widget.meal.strIngredient.where((element) => element != null).toList();
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(strIngredient.length, (index){
              return 
              strIngredient[index] == null ?
              SizedBox(height: 0,) :
              Row(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(200),
                    child: Text(
                      strIngredient[index]!,
                      style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  ),
                  widget.meal.strMeasure[index] == null ?
                  SizedBox() :
                  Container(
                    width: ScreenUtil().setWidth(100),
                    child: Text(
                      widget.meal.strMeasure[index]!,
                      style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  )
                ],
              );
            }),
          )
        ),
      ),
    );
  }
}