import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2.0).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      //child: _Rectangle(),
      builder: (BuildContext context, Widget child) {
        print(rotation.value);
        return Transform.rotate(angle: rotation.value, child: _Rectangle());
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
