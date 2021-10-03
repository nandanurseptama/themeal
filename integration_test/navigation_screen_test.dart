
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:themeal/core/constant/constant_key.dart';
import 'package:themeal/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'HomeScreen IntegrationTest',
    (){
      testWidgets(
        '#1. Should contain Category and Recommendation',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          expect(find.byKey( Key(ConstantKey.homeScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.foodPanelHome)), findsOneWidget);
          expect(find.byKey( Key('${ConstantKey.categoryPanelHome}_0')), findsOneWidget);
        }
      );
      testWidgets(
        '#2. Should contain explore screen',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          var searchNavigationItem = find.byTooltip('Search');
          await tester.tap(searchNavigationItem);
          expect(find.byKey( Key(ConstantKey.exploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchBarExploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.areaDropdownExploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.categoryDropdownExploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchButtonExploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchResultExploreScreen)), findsOneWidget);
        }
      );
    }
  );
}