import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constant_key.dart';
import '../../../core/constant/lang.dart';
import '../../domain/entities/area_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/meal_entity.dart';
import '../bloc/bloc/favorite_bloc.dart';
import '../bloc/meal_bloc/meal_bloc.dart';
import '../widgets/area_dropdown_field_widget.dart';
import '../widgets/category_dropdown_field_widget.dart';
import '../widgets/list_of_meal_widget.dart';
import '../widgets/search_bar_explorer_widget.dart';

class ExploreScreen extends StatefulWidget {
  final void Function(MealEntity meal) onSelectedMeal;
  const ExploreScreen({ Key? key, required this.onSelectedMeal }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final FocusNode searchFieldFocus = new FocusNode();
  final TextEditingController searchFieldController = TextEditingController();
  CategoryEntity? category;
  AreaEntity? area;
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
        searchBar,
        SizedBox(
          height: ScreenUtil().setHeight(10)
        ),
        filter,
        SizedBox(
          height: ScreenUtil().setHeight(10)
        ),
        searchButton,
        SizedBox(
          height: ScreenUtil().setHeight(10)
        ),
        searchResult,
      ],
    );
  }
  Widget get searchBar{
    return SearchBarExplorerWidget(
      searchFieldFocus: searchFieldFocus,
      key: Key(ConstantKey.searchBarExploreScreen),
      searchFieldController: searchFieldController,
    );
  }
  Widget get filter{
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        areaDropdownField,
        categoryDropdownField
      ],
    );
  }
  Widget get areaDropdownField{
    return AreaDropdownFieldWidget(
      key: Key(
        ConstantKey.areaDropdownExploreScreen,
      ),
      onChanged: (value){
        setState(() {
          this.area = value;
        });
      }, 
      value: area,
    );
  }
  Widget get categoryDropdownField{
    return CategoryDropdownFieldWidget(
      key: Key(
        ConstantKey.categoryDropdownExploreScreen,
      ),
      onChanged: (value){
        setState(() {
          this.category =value;
        });
      }, 
      value: category,
    );
  }
  void onSearch(){
    if(this.searchFieldController.text.isNotEmpty){
      Modular.get<MealBloc>().add(SearchMealEvent(query: this.searchFieldController.text));
    }
  }
  Widget get searchButton{
    return MaterialButton(
      minWidth: ScreenUtil().setWidth(340),
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
  Widget get searchResult{
    return ListOfMealWidget(
      category: category,
      area: area,
      onSelectedMeal: (meal) {
        widget.onSelectedMeal(meal);
      },
      key: Key(
        '${ConstantKey.searchResultExploreScreen}'
      ),
      isKeyboarOpen: searchFieldFocus.hasFocus,
    );
  }
}