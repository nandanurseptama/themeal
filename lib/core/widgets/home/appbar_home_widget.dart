import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themeal/core/constant/lang.dart';
class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(20),
        left: ScreenUtil().setWidth(0),
        right: ScreenUtil().setWidth(0)
      ),
      height: ScreenUtil().setHeight(60),
      child: Text(
        AppLang.appBarHomeText,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: ScreenUtil().setSp(14)
        ),
      ),
    );
  }
}