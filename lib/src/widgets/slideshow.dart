import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsPositionUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double dotPrimarySize;
  final double dotSecondarySize;

  Slideshow(
      {@required this.slides,
      this.dotsPositionUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.dotPrimarySize = 12.0,
      this.dotSecondarySize = 12.0});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context).primaryColor =
                this.primaryColor;
            Provider.of<_SlideshowModel>(context).secondaryColor =
                this.secondaryColor;
            Provider.of<_SlideshowModel>(context).dotPrimarySize =
                this.dotPrimarySize;
            Provider.of<_SlideshowModel>(context).dotSecondarySize =
                this.dotSecondarySize;
            return _CreateSlideshowStructure(
                dotsPositionUp: dotsPositionUp, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CreateSlideshowStructure extends StatelessWidget {
  const _CreateSlideshowStructure({
    Key key,
    @required this.dotsPositionUp,
    @required this.slides,
  }) : super(key: key);

  final bool dotsPositionUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsPositionUp) _Dots(this.slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!this.dotsPositionUp) _Dots(this.slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesCount;

  _Dots(this.slidesCount);
  @override
  Widget build(BuildContext context) {
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
    final sliderModelProvider = Provider.of<_SlideshowModel>(context);
    final bool isCurrentPage =
        (sliderModelProvider.currentPage >= index - 0.5 &&
                sliderModelProvider.currentPage < index + 0.5)
            ? true
            : false;
    final double dotSize = isCurrentPage
        ? sliderModelProvider.dotPrimarySize
        : sliderModelProvider.dotSecondarySize;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
          color: isCurrentPage
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _dotPrimarySize = 12.0;
  double _dotSecondarySize = 12.0;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
    notifyListeners();
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
    notifyListeners();
  }

  double get dotPrimarySize => this._dotPrimarySize;
  set dotPrimarySize(double dotPrimarySize) {
    this._dotPrimarySize = dotPrimarySize;
    notifyListeners();
  }

  double get dotSecondarySize => this._dotSecondarySize;
  set dotSecondarySize(double dotSecondarySize) {
    this._dotSecondarySize = dotSecondarySize;
    notifyListeners();
  }
}
