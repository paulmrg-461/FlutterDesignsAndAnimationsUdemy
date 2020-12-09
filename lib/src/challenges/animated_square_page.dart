import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _AnimatedSquare()),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  //Animations
  Animation<double> movementX;
  Animation<double> movementY;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    movementX = Tween(begin: 0.0, end: 160.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut)));

    movementY = Tween(begin: 0.0, end: 0.0).animate(controller);

    controller.addListener(() {
      if (controller.value >= 0.25) {
        movementY = _tweenAnimation(0.0, -160.0, 0.25, 0.5);
        /* movementY = Tween(begin: 0.0, end: -160.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.5, curve: Curves.bounceOut))); */
      }

      if (controller.value >= 0.5) {
        movementX = _tweenAnimation(160.0, 0.0, 0.5, 0.75);
      }

      if (controller.value >= 0.75) {
        movementY = _tweenAnimation(-160.0, 0.0, 0.75, 1.0);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(movementX.value, movementY.value),
          child: child,
        );
      },
    );
  }

  Animation _tweenAnimation(
      double begin, double end, double beginInterval, double endInterval) {
    return Tween(begin: begin, end: end).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(beginInterval, endInterval, curve: Curves.bounceOut)));
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
