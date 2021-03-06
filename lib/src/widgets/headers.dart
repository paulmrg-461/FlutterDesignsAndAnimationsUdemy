import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class BorderRadiusHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Properties
    paint.color = Color(0xff615AAB);
    //paint.style = PaintingStyle.stroke;
    //paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;

    final path = Path();
    //Draw with the path and paint
    //path.moveTo(0, size.height * 0.5);
    //path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Properties
    paint.color = Color(0xff615AAB);
    //paint.style = PaintingStyle.stroke;
    //paint.strokeWidth = 5.0;
    paint.style = PaintingStyle.fill;

    final path = Path();
    //Draw with the path and paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PickHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _PickHeaderPainter(),
      ),
    );
  }
}

class _PickHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    //paint.strokeWidth = 10.0;

    final path = Path();
    //Draw with the path and paint
    //path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _CurvedHeaderPainter(),
      ),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;
    //paint.strokeWidth = 20.0;

    final path = Path();
    //Draw with the path and paint
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.45, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    //paint.style = PaintingStyle.stroke;
    //paint.strokeWidth = 20.0;

    final path = Path();
    //Draw with the path and paint
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GradientWaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _GradientWaveHeaderPainter(),
      ),
    );
  }
}

class _GradientWaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(150.0, 250.0), radius: 90.0);

    final Gradient gradient = new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Color(0xffC012FF),
          Color(0xff6D05E8),
          Color(0xff6D05FA),
        ],
        stops: [
          0.0,
          0.5,
          1.0
        ]);

    final paint = Paint()..shader = gradient.createShader(rect);
    //Properties
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    final path = Path();
    //Draw with the path and paint
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    //path.lineTo(size.width, size.height * 0.3);
    canvas.drawShadow(path, Colors.grey[900], 3.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
