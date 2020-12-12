import 'package:app_designs/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
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
    return Slideshow(
      //dotsPositionUp: true,
      primaryColor: Colors.deepPurple,
      secondaryColor: Colors.white,
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
