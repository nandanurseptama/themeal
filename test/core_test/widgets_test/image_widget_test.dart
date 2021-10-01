import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:themeal/core/widgets/image_widget.dart';

void main(){
  Widget makeTestableWidget() => MaterialApp(home: ImageWidget.fromUrl(
    url: 'https://www.themealdb.com/images/media/meals/u9l7k81628771647.jpg',
  ));
  testWidgets(
    '#1. image widget should load properly',
    (WidgetTester tester)async{
      mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    }
  );
}