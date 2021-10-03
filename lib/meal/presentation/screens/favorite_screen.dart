import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constant_key.dart';
import '../../../core/constant/lang.dart';
import '../bloc/bloc/favorite_bloc.dart';
import '../bloc/meal_bloc/meal_bloc.dart';
import '../widgets/list_of_favorite_meal_widget.dart';
import '../widgets/search_bar_explorer_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FocusNode searchFieldFocus = new FocusNode();
  final TextEditingController searchFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10),
      ),
      child: body,
    );
  }
  Widget get body{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: ScreenUtil().setHeight(20)
        ),
        title,
        SizedBox(
          height: ScreenUtil().setHeight(10)
        ),
        favoriteList,
      ],
    );
  }
  Widget get title{
    return Container(
      child: Text(
        'Favorite',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: ScreenUtil().setSp(24),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  Widget get searchField{
    return Container(
      width: ScreenUtil().setWidth(200),
      child: SearchBarExplorerWidget(
        searchFieldFocus: searchFieldFocus,
        key: Key(ConstantKey.searchFieldFavoriteScreen),
        searchFieldController: searchFieldController,
      )
    );
  }
  Widget get searchButton{
    return MaterialButton(
      minWidth: ScreenUtil().setWidth(130),
      height: ScreenUtil().setHeight(50),
      key: Key(
        ConstantKey.searchButtonExploreScreen,
      ),
      onPressed: onSearch,
      color: Theme.of(context).buttonColor,
      child: Text(
        AppLang.search,
      ),
    );
  }
  Widget get favoriteList{
    return ListOfFavoriteMealWidget(
      onSelectedMeal: (meal) {
        Modular.get<MealBloc>().add(OpenDetailMealEvent(meal: meal));
      },
      key: Key(
        '${ConstantKey.favoriteListFavoriteScreen}'
      ),
      height: 527,
      isKeyboarOpen: searchFieldFocus.hasFocus,
      onDelete: (meal) {
        Modular.get<FavoriteBloc>().add(LikeOrUnlikeEvent(meal: meal));
      },
      emptyMessage: 'Anda belum memiliki makanan favorite',
    );
  }
  void onSearch(){

  }
}