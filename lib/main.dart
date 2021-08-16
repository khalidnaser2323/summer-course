import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/views/screens/home/home_screen.dart';

void main() {
  runApp(getMyAppRootWidget());
}

Widget getMyAppRootWidget() {
  Widget materialAppWidget = new MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  );
  return materialAppWidget;
}
