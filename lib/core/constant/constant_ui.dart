import 'package:flutter/material.dart';

class ConstantUi{
  static const List<Map> bottomNavigationMenu = [
    {
      'title' :  'Home',
      'icon' : Icons.home,
      'value' : 'home'
    },
    {
      'title' :  'Search',
      'icon' : Icons.search,
      'value' : 'search'
    },
    {
      'title' :  'Favorite',
      'icon' : Icons.favorite,
      'value' : 'favorite'
    },
  ];
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xfff6f6f5),
    scaffoldBackgroundColor: Color(0xfff6f6f5),
    buttonColor: Color(0xffe9916e),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xff0e0d0b)
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w500,
        color: Color(0xfff6f6f5)
      ),
      caption: TextStyle(
        color: Color(0xff0e0d0b),
        fontWeight: FontWeight.w100
      )
    ),
    iconTheme: IconThemeData(
      color: Color(0xfff6f6f5)
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0xffcbb39f),
      selectedItemColor: Color(0xffe9916e)
    )
  );
}