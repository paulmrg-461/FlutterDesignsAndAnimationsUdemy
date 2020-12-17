import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  IconHeader({
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.color1 = Colors.deepPurpleAccent,
    this.color2 = Colors.deepPurple,
  });

  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: this.color1, color2: this.color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250.0,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 80.0,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(fontSize: 18, color: whiteColor),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 26, color: whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 22.0,
            ),
            FaIcon(
              this.icon,
              size: 80.0,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBackground({
    @required this.color1,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[this.color1, this.color2])),
    );
  }
}

class GradientWaveHeader extends StatelessWidget {
  final String title;
  final double headerHeight;
  final Color fontColor;
  final double fontSize;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;

  GradientWaveHeader({
    @required this.title,
    this.headerHeight = 300.0,
    this.fontColor = Colors.white,
    this.fontSize = 36.0,
    this.gradientColor1 = Colors.deepPurple,
    this.gradientColor2 = Colors.purple,
    this.gradientColor3 = Colors.purpleAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: this.headerHeight,
          //color: Color(0xff615AAB),
          child: CustomPaint(
            painter: _GradientWaveHeaderPainter(
                this.gradientColor1, this.gradientColor2, this.gradientColor3),
          ),
        ),
        Container(
          height: this.headerHeight - 30.0,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            this.title,
            style: TextStyle(
                fontSize: this.fontSize,
                color: this.fontColor,
                fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }
}

class _GradientWaveHeaderPainter extends CustomPainter {
  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;
  _GradientWaveHeaderPainter(
    this.gradientColor1,
    this.gradientColor2,
    this.gradientColor3,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(150.0, 250.0), radius: 90.0);

    final Gradient gradient = new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          this.gradientColor1,
          this.gradientColor2,
          this.gradientColor3,
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
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.7, size.width, size.height * 0.85);
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
