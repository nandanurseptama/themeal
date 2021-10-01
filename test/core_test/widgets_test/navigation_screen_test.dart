import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themeal/core/constant/constant_key.dart';
import 'package:themeal/core/widgets/navigation_screen.dart';

import 'fixture.dart';

void main(){
  late Widget widget;
  setUpAll((){
    widget = materialApp(
      child: NavigationScreen(),
    );
  });
  group(
    'Navigation Screen Test : ',
    (){
      testWidgets(
        '#1. Navigation must contain HomeScreen, FavoriteScreen & ExploreScreen',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await mockNetworkImagesFor(() => tester.pumpWidget(widget));
          
          var keys = [
            Key(ConstantKey.homeScreen), 
            Key(ConstantKey.favoriteScreen), 
            Key(ConstantKey.exploreScreen)
          ];
          for(var k in keys){
            var finding = find.byKey(k);
            expect(finding, findsOneWidget);
          }
        }
      );
    }
  );
}