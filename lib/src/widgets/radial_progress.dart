import 'dart:math';

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
    return Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MyRadialProgress(percentage: widget.percentage),
        ));
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;

  _MyRadialProgress({@required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    //Arco
    final arcPaint = new Paint()
      ..strokeWidth = 10
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
