import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constant_key.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/preloader_widget.dart';
import '../../domain/entities/area_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/meal_entity.dart';
import '../bloc/bloc/favorite_bloc.dart';
class ListOfFavoriteMealWidget extends StatefulWidget {
  final AreaEntity? area;
  final CategoryEntity? category;
  final void Function(MealEntity meal) onSelectedMeal;
  final bool isKeyboarOpen;
  final double height;
  final String? emptyMessage;
  final void Function(MealEntity meal) onDelete;
  const ListOfFavoriteMealWidget({ Key? key,required this.onDelete, this.emptyMessage, this.category, this.area, this.isKeyboarOpen=false, this.height=400, required this.onSelectedMeal }) : super(key: key);

  @override
  _ListOfFavoriteMealWidgetState createState() => _ListOfFavoriteMealWidgetState();
}

class _ListOfFavoriteMealWidgetState extends State<ListOfFavoriteMealWidget> {
   @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(
        EdgeInsets.fromWindowPadding(
          WidgetsBinding.instance!.window.viewInsets,
          WidgetsBinding.instance!.window.devicePixelRatio).bottom > 0?  (widget.height - 204) : widget.height
      ),
      child: bloc(context: context),
    );
  }
  Widget bloc({required BuildContext context}){
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      bloc : Modular.get<FavoriteBloc>(),
      builder: (context, state) {
        print(state);
        return state is LoadedFavoriteMealState ?
        list(context: context,meals: state.meals) : preloaderList(context: context); 
      },
    );
  }
  Widget list({required BuildContext context, required List<MealEntity> meals}){
    var m = meals;
    if(widget.category != null){
      m = m.where((element) => element.strCategory == widget.category!.strCategory).toList();
    }
    if(widget.area != null){
      m = m.where((element) => element.strCategory == widget.area!.strArea).toList();
    }
    if(m.isEmpty){
      return Container(
        alignment: Alignment.center,
        child: Text(
          widget.emptyMessage ?? 'Hasil pencarian tidak ditemukan',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    }
    return ListView.builder(
      itemCount: meals.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return body(context: context, index: index,meal: meals[index]);
      },
    );
  }
  Widget preloaderList({required BuildContext context}){
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return body(context: context, index: index);
      },
    );
  }
  Widget body({required BuildContext context, MealEntity? meal, required int index}){
    return InkWell(
      onTap: () {
        if(meal!=null){
          widget.onSelectedMeal(meal);
        }
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(5),
            horizontal: ScreenUtil().setWidth(10)
          ),
          width: ScreenUtil().setWidth(340),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              mealImage(url: meal == null ? null : meal.strMealThumb , index: index),
              mealTitle(text: meal == null ? null : meal.strMeal , context: context, index: index),
              deleteButton(index: index,meal: meal),
            ],
          ),
        ),
      ),
    );
  }
  Widget mealImage({String? url, required int index}){
    if(url == null){
      return PreloaderWidget(
        key: Key(
          '${ConstantKey.searchResultItemExploreScreen}_IMAGE_$index'
        ),
        width: ScreenUtil().setWidth(120),
        height: ScreenUtil().setHeight(120),
      );
    }
    return ImageWidget.fromAssetOrNetwork(
      key: Key(
        '${ConstantKey.searchResultItemExploreScreen}_IMAGE_$index'
      ),
      url: url,
      radius: BorderRadius.circular(ScreenUtil().setWidth(10)),
      fit: BoxFit.cover,
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(120),
    );
  }
  Widget mealTitle({String? text, required BuildContext context, required int index}){
    if(text == null){
      return PreloaderWidget(
        key: Key(
          '${ConstantKey.searchResultItemExploreScreen}_TITLE_$index'
        ),
        width: ScreenUtil().setWidth(130),
        height: ScreenUtil().setHeight(20),
      );
    }
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(10)
      ),
      key: Key(
        '${ConstantKey.searchResultItemExploreScreen}_TITLE_$index'
      ),
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(130),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(16),
        )
      ),
    );
  }
  Widget deleteButton({MealEntity? meal, required int index}){
    if(meal == null){
      return PreloaderWidget(
        key: Key(
          '${ConstantKey.searchResultItemExploreScreen}_DELETE_$index'
        ),
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(50),
      );
    }
    return MaterialButton(
      key: Key(
        '${ConstantKey.searchResultItemExploreScreen}_DELETE_$index'
      ),
      minWidth: ScreenUtil().setWidth(50),
      height: ScreenUtil().setHeight(50),
      child: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onPressed: () {
        if(meal != null){
          widget.onDelete(meal);
        }
      },
    );
  }
}