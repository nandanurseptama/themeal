import 'package:flutter/material.dart';

import '../constant/constant_ui.dart';
class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int value) onSelectedItem;
  const BottomNavigationWidget({ Key? key, required this.currentIndex, required this.onSelectedItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: ConstantUi.bottomNavigationMenu.map((e){
        return item(item: e['title'], iconData: e['icon']);
      }).toList(),
      onTap: (value) {
        this.onSelectedItem(value);
      },
    );
  }
  BottomNavigationBarItem item({required String item, required IconData iconData}){
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: item,
    );
  }
}