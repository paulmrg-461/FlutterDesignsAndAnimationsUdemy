import 'package:flutter/material.dart';

class FatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FatButtonBackground();
  }
}

class _FatButtonBackground extends StatelessWidget {
  const _FatButtonBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(4, 6),
                blurRadius: 10.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          gradient: LinearGradient(colors: <Color>[
            Color(0xff6989F5),
            Color(0xff906EF5),
          ])),
    );
  }
}
