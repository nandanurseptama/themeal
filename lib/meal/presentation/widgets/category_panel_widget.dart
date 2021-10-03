import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/preloader_widget.dart';
import '../../domain/entities/category_entity.dart';

class CategoryPanelWidget extends StatelessWidget {
  final CategoryEntity? category;
  const CategoryPanelWidget({ Key? key , this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(20),
          ),
        ),
        height: ScreenUtil().setWidth(120),
        width: ScreenUtil().setWidth(100),
        child: body(context: context),
      ),
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
    return 
    this.category == null ?
    Positioned(
      left: ScreenUtil().setWidth(10),
      child: PreloaderWidget(
        height: ScreenUtil().setWidth(100),
        width: ScreenUtil().setWidth(80),
        radius: ScreenUtil().setWidth(20),
      ),
    ) : 
    Positioned(
      left: ScreenUtil().setWidth(10),
      child: ImageWidget.fromAssetOrNetwork(
        url: this.category!.strCategoryThumb,
        height: ScreenUtil().setWidth(100),
        width: ScreenUtil().setWidth(80),
        fit: BoxFit.cover,
        radius: BorderRadius.circular(
          ScreenUtil().setWidth(20),
        ),
      ),
    );
  }
  Widget categoryName({required BuildContext context}){
    return 
    Positioned(
      bottom: ScreenUtil().setHeight(10),
      left: ScreenUtil().setWidth(10),
      child: this.category == null ?
      PreloaderWidget(width: ScreenUtil().setWidth(80), height: ScreenUtil().setHeight(20)) : 
      Container(
        child: Text(
          this.category!.strCategory,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 2,
        ),
      )
    );
  }
}