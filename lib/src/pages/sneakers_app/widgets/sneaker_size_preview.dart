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
            //TODO Sizes
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
        children: <Widget>[Image(image: AssetImage('assets/imgs/azul.png'))],
      ),
    );
  }
}
