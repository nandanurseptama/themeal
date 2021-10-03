import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themeal/app/app_module.dart';
import 'package:themeal/app/app_widget.dart';

Widget materialAppForIntegrationTest(){
  return ModularApp(module: AppModule(), child: AppWidget());
}