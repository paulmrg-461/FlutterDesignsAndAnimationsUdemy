import 'package:app_designs/src/models/layout_model.dart';
import 'package:app_designs/src/pages/launcher_page.dart';
import 'package:app_designs/src/pages/launcher_page_tablet.dart';
import 'package:app_designs/src/pages/sneakers_app/pages/sneaker_page.dart';
import 'package:app_designs/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(1),
      ),
      ChangeNotifierProvider(
        create: (_) => LayoutModel(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: themeProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'App Designs',
        home: SneakerPage());
  }
}
