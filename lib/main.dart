import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constant/constant_ui.dart';
import 'core/widgets/navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return  MaterialApp(
          title: 'The Meal',
          theme: ConstantUi.lightTheme,
          home: NavigationScreen(
            
          ),
        );
      },
    );
  }
}