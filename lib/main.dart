import 'package:app_designs/src/pages/launcher_page.dart';
import 'package:app_designs/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => ThemeChanger(2), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: themeProvider.currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'App Designs',
        home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            print('Orientation: $orientation');
            return Container(
              child: LauncherPage(),
            );
          },
        ));
  }
}
