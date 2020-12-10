import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  double percentage;

  RadialProgress({Key key, @required this.percentage});
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Text('Percentage : ${this.widget.percentage} %');
  }
}
