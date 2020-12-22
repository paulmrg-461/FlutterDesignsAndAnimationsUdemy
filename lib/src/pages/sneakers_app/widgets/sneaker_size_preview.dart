import 'package:flutter/material.dart';

class SneakerSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
      child: Container(
        width: double.infinity,
        height: 430.0,
        decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: BorderRadius.circular(48.0)),
        child: Column(
          children: <Widget>[
            //Sneaker
            _SneakerShadowImage(),
            _SneakerSize()
          ],
        ),
      ),
    );
  }
}

class _SneakerShadowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 20.0, left: 0.0, child: _SneakerShadow()),
          Image(image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _SneakerShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)]),
      ),
    );
  }
}

class _SneakerSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SizeSneakerContainer(7),
          _SizeSneakerContainer(7.5),
          _SizeSneakerContainer(8),
          _SizeSneakerContainer(8.5),
          _SizeSneakerContainer(9),
          _SizeSneakerContainer(9.5),
        ],
      ),
    );
  }
}

class _SizeSneakerContainer extends StatelessWidget {
  final double sizeNumber;

  _SizeSneakerContainer(this.sizeNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '${sizeNumber.toString().replaceAll('.0', '')}',
          style: TextStyle(
              color: Color(0xffF1A23A),
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 10.0)]),
    );
  }
}
