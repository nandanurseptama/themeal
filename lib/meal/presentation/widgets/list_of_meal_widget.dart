import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/constant_key.dart';
import '../../../core/widgets/image_widget.dart';

class ListOfMealWidget extends StatelessWidget {
  final bool isKeyboarOpen;
  const ListOfMealWidget({ Key? key, this.isKeyboarOpen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(
        this.isKeyboarOpen ? 196 : 400
      ),
      key: Key(
        '${ConstantKey.searchResultExploreScreen}'
      ),
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return body(
            text: 'Lorem ipsum dolor sit amet',
            context: context,
            url: 'https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg',
            index: index
          );
        },
      ),
    );
  }
  Widget body({required BuildContext context, required String url, required String text, required int index}){
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(5)
      ),
      width: ScreenUtil().setWidth(340),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mealImage(url: url, index: index),
          mealTitle(text: text, context: context, index: index),
        ],
      ),
    );
  }
  Widget mealImage({required String url, required int index}){
    return ImageWidget.fromAssetOrNetwork(
      key: Key(
        '${ConstantKey.searchResultItemExploreScreen}_IMAGE_$index'
      ),
      url: url,
      radius: BorderRadius.circular(ScreenUtil().setWidth(10)),
      fit: BoxFit.cover,
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(120),
    );
  }
  Widget mealTitle({required String text, required BuildContext context, required int index}){
    return Container(
      key: Key(
        '${ConstantKey.searchResultItemExploreScreen}_TITLE_$index'
      ),
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(200),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        maxLines: 2,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(16),
        )
      ),
    );
  }
}