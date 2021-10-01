import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/constant_key.dart';
import '../../../core/constant/lang.dart';
import '../../../core/widgets/home/area_dropdown_field_widget.dart';
import '../widgets/category_dropdown_field_widget.dart';
import '../widgets/list_of_meal_widget.dart';
import '../widgets/search_bar_explorer_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({ Key? key }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final FocusNode searchFieldFocus = new FocusNode();
  final TextEditingController searchFieldController = TextEditingController();
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

      }, 
      value: 'China'
    );
  }
  Widget get categoryDropdownField{
    return CategoryDropdownFieldWidget(
      key: Key(
        ConstantKey.categoryDropdownExploreScreen,
      ),
      onChanged: (value){

      }, 
      value: 'Egg'
    );
  }
  void onSearch(){

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
      isKeyboarOpen: searchFieldFocus.hasFocus,
    );
  }
}