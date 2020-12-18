import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Notifications Page'),
      ),
      floatingActionButton: _FloatingButton(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => print('Hola Tortolas'),
      backgroundColor: Colors.deepPurple,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.deepPurple,
      items: [
        BottomNavigationBarItem(
            title: Text('Bones'), icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    child: Center(
                      child: Text(
                        '99',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.8),
                        shape: BoxShape.circle),
                  ),
                  /* child: Icon(
                    Icons.brightness_1,
                    size: 8.0,
                    color: Colors.redAccent,
                  ), */
                )
              ],
            )),
        BottomNavigationBarItem(
            title: Text('My Dog'), icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}
