import 'package:app_designs/src/pages/animations/animations1_page.dart';
import 'package:app_designs/src/pages/animations/navigation_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Designs',
        home: NavigationPage());
  }
}
