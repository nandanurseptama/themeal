import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themeal/core/constant/constant_key.dart';
import 'package:themeal/meal/presentation/screens/explore_screen.dart';

import '../../../../core_test/widgets_test/fixture.dart';

void main(){
  late Widget testableWidget;

  setUpAll((){
    testableWidget = materialApp(
      child: Scaffold(
        body: ExploreScreen(
          onSelectedMeal: (meal) {
            
          },
        ),
      )
    );
  });

  group(
    'Explore Screen Test : ',
    (){
      testWidgets(
        '#1. Explore Screen must contain search bar',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await tester.pumpWidget(testableWidget);
          var findSearchBar = find.byKey(
            Key(ConstantKey.searchBarExploreScreen),
          );
          expect(findSearchBar, findsOneWidget);
        }
      );
      testWidgets(
        '#2. Explore Screen must contain area dropdown field',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await tester.pumpWidget(testableWidget);
          var findSearchBar = find.byKey(
            Key(ConstantKey.areaDropdownExploreScreen),
          );
          expect(findSearchBar, findsOneWidget);
        }
      );
      testWidgets(
        '#3. Explore Screen must contain category dropdown field',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await tester.pumpWidget(testableWidget);
          var findSearchBar = find.byKey(
            Key(ConstantKey.categoryDropdownExploreScreen),
          );
          expect(findSearchBar, findsOneWidget);
        }
      );
      testWidgets(
        '#4. Explore Screen must contain search button',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await tester.pumpWidget(testableWidget);
          var findSearchBar = find.byKey(
            Key(ConstantKey.searchButtonExploreScreen),
          );
          expect(findSearchBar, findsOneWidget);
        }
      );
      testWidgets(
        '#5. Explore Screen must have search result widget',
        (WidgetTester tester)async{
          await tester.binding.setSurfaceSize(surfaceSize);
          await tester.pumpWidget(testableWidget);
          var findSearchBar = find.byKey(
            Key(ConstantKey.searchResultExploreScreen),
          );
          expect(findSearchBar, findsOneWidget);
        }
      );
    }
  );

}