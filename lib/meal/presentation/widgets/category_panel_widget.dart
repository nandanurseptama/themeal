import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/image_widget.dart';

class CategoryPanelWidget extends StatelessWidget {
  const CategoryPanelWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(20),
        ),
      ),
      height: ScreenUtil().setWidth(120),
      width: ScreenUtil().setWidth(100),
      child: body(context: context),
    );
  }
  Widget body({required BuildContext context}){
    return Stack(
      children: [
        categoryImage(context: context),
        categoryName(context: context)
      ],
    );
  }
  Widget categoryImage({required BuildContext context}){
    return ImageWidget.fromAssetOrNetwork(
      url: 'https://www.themealdb.com/images/ingredients/Lime.png',
      height: ScreenUtil().setWidth(100),
      width: ScreenUtil().setWidth(80),
      fit: BoxFit.cover,
      radius: BorderRadius.circular(
        ScreenUtil().setWidth(20),
      ),
    );
  }
  Widget categoryName({required BuildContext context}){
    return Positioned(
      bottom: ScreenUtil().setHeight(10),
      left: ScreenUtil().setWidth(10),
      child: Container(
        child: Text(
          'Category Name',
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 2,
        ),
      )
    );
  }
}