import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themeal/core/constant/lang.dart';

class CategoryDropdownFieldWidget extends StatelessWidget {
  final String? value;
  final void Function(String value) onChanged;
  const CategoryDropdownFieldWidget({ Key? key, required this.onChanged, required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: AppLang.category,
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(0),
            horizontal: ScreenUtil().setWidth(10)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(10)
            )
          )
        ),
        value: value,
        onChanged: (value) {
          this.onChanged(value as String);
        },
        items: ['Seafood','Chicken','Egg'].map((e){
          return item(context: context, value: e);
        }).toList(),
      ),
    );
  }
  DropdownMenuItem<String> item({required BuildContext context, required String value}){
    return DropdownMenuItem<String>(
      child: Text(
        value,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: value,
    );
  }
}