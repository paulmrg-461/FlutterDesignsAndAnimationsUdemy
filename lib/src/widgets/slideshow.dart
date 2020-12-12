import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_designs/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsPositionUp;
  final Color primaryColor;
  final Color secondaryColor;

  Slideshow(
      {@required this.slides,
      this.dotsPositionUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            if (this.dotsPositionUp)
              _Dots(this.slides.length, this.primaryColor, this.secondaryColor),
            Expanded(child: _Slides(this.slides)),
            if (!this.dotsPositionUp)
              _Dots(this.slides.length, this.primaryColor, this.secondaryColor)
          ],
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesCount;
  final Color primaryColor;
  final Color secondaryColor;

  _Dots(this.slidesCount, this.primaryColor, this.secondaryColor);
  @override
  Widget build(BuildContext context) {
    //final sliderModelProvider = Provider.of<SliderModel>(context);
    Provider.of<SliderModel>(context).primaryColor = this.primaryColor;
    Provider.of<SliderModel>(context).secondaryColor = this.secondaryColor;
    //sliderModelProvider.secondaryColor = this.secondaryColor;
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              this.slidesCount,
              (index) => _Dot(
                    index: index,
                  ))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot({this.index});

  @override
  Widget build(BuildContext context) {
    final sliderModelProvider = Provider.of<SliderModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
          color: (sliderModelProvider.currentPage >= index - 0.5 &&
                  sliderModelProvider.currentPage < index + 0.5)
              ? sliderModelProvider.primaryColor
              : sliderModelProvider.secondaryColor,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}
