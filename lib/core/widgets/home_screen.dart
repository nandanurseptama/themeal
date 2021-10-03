import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../meal/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../meal/presentation/widgets/category_panel_widget.dart';
import '../constant/constant_key.dart';
import '../constant/lang.dart';
import 'home/appbar_home_widget.dart';
import 'home/food_panel_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarHome,
          SizedBox(height: ScreenUtil().setHeight(10)),
          recommendationText,
          SizedBox(height: ScreenUtil().setHeight(10)),
          panel,
          SizedBox(height: ScreenUtil().setHeight(20)),
          categoryText,
          SizedBox(height: ScreenUtil().setHeight(10)),
          categoryList,
        ],
      ),
    );
  }
  Widget get appBarHome{
    return AppBarHomeWidget(
      key: Key(ConstantKey.appBarHomeWidget),
    );
  }
  Widget get recommendationText{
    return Text(
      AppLang.recommendation,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: ScreenUtil().setSp(18)
      ),
    );
  }
  Widget get panel{
    return FoodPanelWidget(key: Key(ConstantKey.foodPanelHome),);
  }
  Widget get categoryText{
    return Text(
      AppLang.category,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: ScreenUtil().setSp(18)
      ),
    );
  }
  Widget get categoryList{
    return Container(
      height: ScreenUtil().setHeight(150),
      child: BlocBuilder<CategoriesBloc,CategoriesState>(
        bloc: Modular.get<CategoriesBloc>(),
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state is LoadedCategoriesState ? state.categories.length : 3,
            itemBuilder: (context, index) {
              return CategoryPanelWidget(
                category: state is LoadedCategoriesState ? state.categories[index] : null,
                key: Key(
                  '${ConstantKey.categoryPanelHome}_$index'
                ),
              );
            },
          );
        },
      )
    );
  }
}