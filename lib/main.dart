import 'package:flutter/material.dart';
import 'package:watch_store/component/theme.dart';
import 'package:watch_store/route_manager/routes.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/mainscreen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
       home: MainScreen(),
      //initialRoute: ScreenNames.root,
      //routes: routes,
    );
  }
}
