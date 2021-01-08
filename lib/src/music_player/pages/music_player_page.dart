import 'package:app_designs/src/music_player/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        _ImageDiscAndDuration(),
        _TitleAndActionButton()
      ],
    ));
  }
}

class _ImageDiscAndDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      margin: EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_DiscImage(), _ProgressBar()],
      ),
    );
  }
}

class _TitleAndActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SongTitle(),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xffF8CB51),
            child: FaIcon(
              FontAwesomeIcons.play,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}

class _SongTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Far Away',
            textAlign: TextAlign.left,
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 32),
          ),
          Text(
            '-Breaking Benjamin-',
            textAlign: TextAlign.left,
            style:
                TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 12);
    return Container(
      height: 270.0,
      margin: EdgeInsets.only(right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '04:53',
            style: style,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 220,
                width: 3,
                color: Colors.white.withOpacity(0.4),
              ),
              Container(
                height: 150,
                width: 3,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
          Text(
            '02:58',
            style: style,
          ),
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
