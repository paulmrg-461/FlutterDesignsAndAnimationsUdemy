import 'package:app_designs/src/pages/animations_page.dart';
import 'package:app_designs/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'App Designs', home: AnimationsPage());
  }
}
