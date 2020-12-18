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
            onPressed: () => print('Hola amiguis'),
            icon: FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () => print('Hola amiguis'),
            icon: FaIcon(FontAwesomeIcons.chevronRight),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Hola Tolis'),
        child: FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40.0,
            ),
            Text(
              'Title',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300),
            ),
            Text(
              'I\'m a small text',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
            ),
            Container(
              width: 180.0,
              height: 2.0,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
