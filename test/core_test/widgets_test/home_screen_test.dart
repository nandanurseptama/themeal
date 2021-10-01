import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themeal/core/constant/constant_key.dart';
import 'package:themeal/core/widgets/home_screen.dart';

import 'fixture.dart';
void main(){
  late Widget widget;
  setUpAll((){
    widget = materialApp(
      child: Scaffold(
        body: HomeScreen(),
      ),
    );
  });
  group(
    'HomeScreen Test : ',
    (){
      testWidgets(
        '#1. HomeScreen should contain appbar',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await mockNetworkImagesFor(() => tester.pumpWidget(widget));
          await tester.pumpWidget(widget);
          var findAppBar = find.byKey(
            Key(ConstantKey.appBarHomeWidget),
          );
          expect(findAppBar, findsOneWidget);
        }
      );
      testWidgets(
        '#2. HomeScreen should contain recommendation food panel',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await mockNetworkImagesFor(() => tester.pumpWidget(widget));
          await tester.pumpWidget(widget);
          var findRecommendationFoodPanel = find.byKey(
            Key(ConstantKey.foodPanelHome),
          );
          expect(findRecommendationFoodPanel, findsOneWidget);
        }
      );
      testWidgets(
        '#3. HomeScreen should contain category list',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await mockNetworkImagesFor(() => tester.pumpWidget(widget));
          await tester.pumpWidget(widget);
          for(var i=0; i<3; i++){
             var findCategoryList = find.byKey(
              Key('${ConstantKey.categoryPanelHome}_$i'),
            );
            expect(findCategoryList, findsOneWidget);
          }
        }
      );
    }
  );
}