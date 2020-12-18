import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          Provider.of<_NotificationModel>(context, listen: false).number += 1,
      backgroundColor: Colors.deepPurple,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationCounter = Provider.of<_NotificationModel>(context).number;
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
                  child: BounceInDown(
                    child: Container(
                      child: Center(
                        child: Text(
                          '$notificationCounter',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ),
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.8),
                          shape: BoxShape.circle),
                    ),
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

class _NotificationModel extends ChangeNotifier {
  int _number = 0;

  int get number => this._number;
  set number(int number) {
    this._number = number;
    notifyListeners();
  }
}
