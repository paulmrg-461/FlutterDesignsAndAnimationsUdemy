import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
              () => this.animate ? this.animate = false : this.animate = true);
        },
        backgroundColor: Colors.deepPurple,
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: this.animate,
          from: 30,
          duration: Duration(seconds: 1),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 44.0,
          ),
        ),
      ),
    );
  }
}
