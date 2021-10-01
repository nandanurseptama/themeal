import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/lang.dart';

class SearchBarExplorerWidget extends StatelessWidget {
  final FocusNode searchFieldFocus;
  final TextEditingController searchFieldController;
  const SearchBarExplorerWidget({ Key? key,required this.searchFieldFocus, required this.searchFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: searchField(context: context),
    );
  }

  Widget searchField({required BuildContext context}){
    return Container(
      child: TextFormField(
        focusNode: searchFieldFocus,
        controller: this.searchFieldController,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: ScreenUtil().setWidth(10),
            right: ScreenUtil().setWidth(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(10),
            ),
          ),
          hintText: AppLang.typeSomething,
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.w300
          ),
        ),
      )
    );
  }
}