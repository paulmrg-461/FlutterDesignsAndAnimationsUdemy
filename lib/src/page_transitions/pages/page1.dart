import 'package:app_designs/src/page_transitions/pages/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pages),
        onPressed: () => Navigator.push(context, _createRoute()),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.deepPurple,
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Page2(),
        transitionDuration: Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          return RotationTransition(
            child: FadeTransition(
              child: child,
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            ),
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          );
        });
  }
}
