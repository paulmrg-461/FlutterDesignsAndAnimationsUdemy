import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [Expanded(child: _Slides()), _Dots()],
      )),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(),
          _Dot(),
          _Dot(),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        children: [
          _Slide('assets/images/slide-1.svg'),
          _Slide('assets/images/slide-2.svg'),
          _Slide('assets/images/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg),
    );
  }
}
