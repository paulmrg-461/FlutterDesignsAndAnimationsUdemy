import 'package:app_designs/src/music_player/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [CustomAppBar(), _ImageDiscAndDuration()],
    ));
  }
}

class _ImageDiscAndDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _DiscImage()
          //TODO: Progessbar
        ],
      ),
    );
  }
}

class _DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      margin: EdgeInsets.all(18.0),
      width: 250.0,
      height: 250.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/aurora.jpg'),
              fit: BoxFit.cover,
            ),
            _CircularCenterDot(28, Colors.black38),
            _CircularCenterDot(20, Color(0xff1C1C25)),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0xff484750), Color(0xff1E1C24)])),
    );
  }
}

class _CircularCenterDot extends StatelessWidget {
  final double size;
  final Color color;

  _CircularCenterDot(
    this.size,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(100)),
    );
  }
}
