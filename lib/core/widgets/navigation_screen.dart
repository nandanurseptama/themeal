import 'package:flutter/material.dart';

import '../../meal/presentation/screens/explore_screen.dart';
import '../../meal/presentation/screens/favorite_screen.dart';
import '../constant/constant_key.dart';
import 'bottom_navigation_widget.dart';
import 'home_screen.dart';
/// NavigationScreen
///
/// Contain HomeScreen, ExploreScreen & FavoriteScreen
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({ Key? key }) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: currentScreen,
        onSelectedItem: (value) {
          onSelectedNavigationItem(value);
        },
      ),
      body: IndexedStack(
        index: currentScreen,
        children: [
          home,
          explore,
          favorite,
        ],
      ),
    );
  }
  void onSelectedNavigationItem(int value){
    setState(() {
      this.currentScreen = value;
    });
  }
  Widget get home{
    return HomeScreen(
      key: Key(ConstantKey.homeScreen),
    );
  }
  Widget get favorite{
    return FavoriteScreen(
      key: Key(ConstantKey.favoriteScreen),
    );
  }
  Widget get explore{
    return ExploreScreen(
      key: Key(ConstantKey.exploreScreen),
    );
  }
}