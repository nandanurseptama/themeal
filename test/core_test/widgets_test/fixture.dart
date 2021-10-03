import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themeal/app/app_module.dart';
import 'package:themeal/app/app_widget.dart';
import 'package:themeal/core/constant/constant_ui.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:http/testing.dart' show MockClient;

Widget materialApp({required Widget child}){
  return ModularApp(
    module: AppModule(), 
    child: AppWidget(
      child: ScreenUtilInit(
        builder: () {
          return MaterialApp(
            title: 'The Meal',
            theme: ConstantUi.lightTheme,
            home: child
          );
        },
      ),
    )
  );
}
var dummyImagePath = '/dummy.png';
Size surfaceSize = Size(1080, 1920);
Client createMockImageHttpClient() => new MockClient((request) {
      switch (request.url.path) {
        case '/dummy.png':
          return new Future.value(new Response.bytes(
              base64Decode(imageResponseBody), 200,
              request: request, headers: {'Content-type': 'image/jpg'}));
        default:
          return new Future.value(new Response('', 404));
      }
    });
var imageResponseBody = """iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+P+/HgAFhAJ/wlseKgAAAABJRU5ErkJggg==""";
