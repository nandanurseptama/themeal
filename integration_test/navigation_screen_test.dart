
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:themeal/core/constant/constant_key.dart';
import 'package:themeal/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'NavigationScreen IntegrationTest',
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

          var areaDropdown = find.byKey(Key(ConstantKey.areaDropdownExploreScreen));
          var categoryDropdown = find.byKey(Key(ConstantKey.categoryDropdownExploreScreen));
          expect(find.byKey( Key(ConstantKey.exploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchBarExploreScreen)), findsOneWidget);
          expect(areaDropdown, findsOneWidget);
          expect(categoryDropdown, findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchButtonExploreScreen)), findsOneWidget);
          expect(find.byKey( Key(ConstantKey.searchResultExploreScreen)), findsOneWidget);
        }
      );
      testWidgets(
        '#3. xplore Screen. Tapping area field',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          var searchNavigationItem = find.byTooltip('Search');
          await tester.tap(searchNavigationItem);

          var areaDropdown = find.byKey(Key(ConstantKey.areaDropdownExploreScreen));
          expect(areaDropdown, findsOneWidget);

          await tester.tap(areaDropdown,warnIfMissed: true);
          await tester.tap(find.byKey(Key('${ConstantKey.areaDropdownValueExploreScreen}_Canadian')),warnIfMissed: true);

          expect(find.text('Canadian'), findsOneWidget);
        }
      );
      testWidgets(
        '#4. Explore Screen. Tapping category field',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          var searchNavigationItem = find.byTooltip('Search');
          await tester.tap(searchNavigationItem);

          var categoryDropdown = find.byKey(Key(ConstantKey.categoryDropdownExploreScreen));
          expect(categoryDropdown, findsOneWidget);
          await tester.tap(categoryDropdown,warnIfMissed: true);
          await tester.tap(find.byKey(Key('${ConstantKey.categoryDropdownValueExploreScreen}_Beef')),warnIfMissed: true);

          expect(find.byKey(Key('${ConstantKey.categoryDropdownValueExploreScreen}_TEXT_Beef')), findsOneWidget);
        }
      );
      testWidgets(
        '#5. Explore Screen. Writing on search field',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          var searchNavigationItem = find.byTooltip('Search');
          await tester.tap(searchNavigationItem);

          var searchField = find.byKey(Key(ConstantKey.searchBarExploreScreen));
          expect(searchField, findsOneWidget);
          await tester.enterText(searchField, 'nasi');

          expect(find.text('nasi'), findsWidgets);
        }
      );

      testWidgets(
        '#5. Explore Screen. Tapping search button',
        (WidgetTester tester)async{
          app.main();
          await tester.pumpAndSettle();
          var searchNavigationItem = find.byTooltip('Search');
          await tester.tap(searchNavigationItem);

          var searchField = find.byKey(Key(ConstantKey.searchBarExploreScreen));
          var searchButton = find.byKey(Key(ConstantKey.searchButtonExploreScreen));
          expect(searchField, findsOneWidget);

          await tester.enterText(searchField, 'nasi');
          await tester.tap(searchButton);
          await tester.pumpAndSettle(Duration(seconds: 3));
          expect(find.text('nasi'), findsWidgets);
          expect(find.text('Nasi lemak'), findsWidgets);
        }
      );
    }
  );
}