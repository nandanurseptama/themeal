import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant_key.dart';
import '../image_widget.dart';

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
        child: body(context: context),
      ),
    );
  }
  Widget body({required BuildContext context}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cover,
        SizedBox(height: ScreenUtil().setHeight(10)),
        title(context: context),
        SizedBox(height: ScreenUtil().setHeight(10)),
        description(context: context),
        SizedBox(height: ScreenUtil().setHeight(10)),
        buttonLove(context: context)
      ],
    );
  }
  Widget title({required BuildContext context}){
    return Container(
      key: Key(ConstantKey.foodPanelHomeTitle),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        'Lorem ipsum dolor sit amet',
        maxLines: 1,
        textAlign: TextAlign.left,
        style:Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: ScreenUtil().setSp(16)
        ),
      ),
    );
  }
  Widget description({required BuildContext context}){
    return Container(
      key: Key(ConstantKey.foodPanelHomeDesc),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        maxLines: 3,
        textAlign: TextAlign.left,
        style:Theme.of(context).textTheme.caption!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(12)
        ),
      ),
    );
  }
  Widget get cover{
    return ImageWidget.fromAssetOrNetwork(
      key: Key(ConstantKey.foodPanelHomeImage),
      url: 'https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg',
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
  Widget buttonLove({required BuildContext context}){
    return MaterialButton(
      key: Key(ConstantKey.foodPanelHomeButtonLove),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(ScreenUtil().setWidth(20))
        )
      ),
      color: Theme.of(context).buttonColor,
      child: Icon(Icons.favorite,color: Theme.of(context).iconTheme.color),
      minWidth: ScreenUtil().setWidth(50),
      height: ScreenUtil().setHeight(50),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setHeight(10)
      ),
      onPressed: () {
        
      },
    );
  }
}