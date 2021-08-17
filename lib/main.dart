import 'package:flutter/material.dart';
import 'package:iti_summer_course_tutorial/services/cache_handler.dart';
import 'package:iti_summer_course_tutorial/utils/constants.dart';
import 'package:iti_summer_course_tutorial/views/screens/home/home_screen.dart';
import 'package:iti_summer_course_tutorial/views/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget homeWidget = await getHomeWidget();
  runApp(getMyAppRootWidget(homeWidget));
}

Future<Widget> getHomeWidget() async {
  String? userToken = await CacheHandler().getData(Constants.TOKEN_CACHE_KEY);
  if (userToken != null) {
    return HomeScreen();
  } else {
    return LoginScreen();
  }
}

Widget getMyAppRootWidget(Widget homeWidget) {
  Widget materialAppWidget = new MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: homeWidget,
    debugShowCheckedModeBanner: false,
  );
  return materialAppWidget;
}
