import 'package:app_designs/src/models/layout_model.dart';
import 'package:app_designs/src/music_player/models/audio_player_model.dart';
import 'package:app_designs/src/music_player/pages/music_player_page.dart';
import 'package:app_designs/src/music_player/theme/theme.dart';
import 'package:app_designs/src/pages/sneakers_app/models/sneaker_model.dart';
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
      ChangeNotifierProvider(create: (_) => SneakerModel()),
      ChangeNotifierProvider(create: (_) => AudioPlayerModel())
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        title: 'App Designs',
        home: MusicPlayerPage());
  }
}
