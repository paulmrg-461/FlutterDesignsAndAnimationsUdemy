import 'package:app_designs/src/theme/theme_changer.dart';
import 'package:app_designs/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: MySlideshow()),
        Expanded(child: MySlideshow())
      ],
    ));
  }
}

class MySlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return Slideshow(
      //dotsPositionUp: true,
      primaryColor: themeProvider.darkTheme
          ? themeProvider.currentTheme.accentColor
          : Colors.deepPurple,
      secondaryColor: themeProvider.darkTheme ? Colors.white : Colors.grey,
      dotPrimarySize: 18,
      dotSecondarySize: 12,
      slides: [
        SvgPicture.asset('assets/images/slide-1.svg'),
        SvgPicture.asset('assets/images/slide-2.svg'),
        SvgPicture.asset('assets/images/slide-3.svg'),
        SvgPicture.asset('assets/images/slide-4.svg'),
        SvgPicture.asset('assets/images/slide-5.svg'),
      ],
    );
  }
}
