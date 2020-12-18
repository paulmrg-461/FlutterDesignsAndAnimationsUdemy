import 'package:animate_do/animate_do.dart';
import 'package:app_designs/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Animations1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Do'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext context) => TwitterPage())),
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          SlideInLeft(
            from: 100.0,
            child: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => Animations1Page())),
              icon: FaIcon(FontAwesomeIcons.chevronRight),
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () => print('Hola Tolis'),
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 50.0,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInUpBig(
              delay: Duration(milliseconds: 600),
              child: Text(
                'I\'m a small text',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 130.0,
                height: 2.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
