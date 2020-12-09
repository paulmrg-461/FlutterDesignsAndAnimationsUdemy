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
  Animation<double> rightMovement;
  Animation<double> upMovement;
  Animation<double> leftMovement;
  Animation<double> downMovement;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    rightMovement = _tweenAnimation(0.0, 160.0, 0, 0.25);
    upMovement = _tweenAnimation(0.0, -160.0, 0.25, 0.5);
    leftMovement = _tweenAnimation(0.0, -160.0, 0.5, 0.75);
    downMovement = _tweenAnimation(0.0, 160.0, 0.75, 1.0);

    controller.addListener(() {
      controller.status == AnimationStatus.completed
          ? controller.reset()
          : print("The animation is in process");
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
          offset: Offset(rightMovement.value + leftMovement.value,
              upMovement.value + downMovement.value),
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
