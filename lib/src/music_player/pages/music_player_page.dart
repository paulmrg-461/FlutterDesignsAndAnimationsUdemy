import 'package:animate_do/animate_do.dart';
import 'package:app_designs/src/music_player/helpers/helpers.dart';
import 'package:app_designs/src/music_player/models/audio_player_model.dart';
import 'package:app_designs/src/music_player/widgets/custom_appbar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _Background(),
        Column(
          children: [
            CustomAppBar(),
            _ImageDiscAndDuration(),
            _TitleAndActionButton(),
            Expanded(child: _Lyrics())
          ],
        ),
      ],
    ));
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333E),
                Color(0xff201E28),
              ])),
    );
  }
}

class _Lyrics extends StatelessWidget {
  final lyrics = getLyrics();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
          physics: BouncingScrollPhysics(),
          itemExtent: 36,
          diameterRatio: 1.5,
          children: lyrics
              .map((line) => Text(
                    line,
                    style: TextStyle(
                        fontSize: 18.0, color: Colors.white.withOpacity(0.6)),
                  ))
              .toList()),
    );
  }
}

class _ImageDiscAndDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_DiscImage(), _ProgressBar()],
      ),
    );
  }
}

class _TitleAndActionButton extends StatefulWidget {
  @override
  __TitleAndActionButtonState createState() => __TitleAndActionButtonState();
}

class __TitleAndActionButtonState extends State<_TitleAndActionButton>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  AnimationController controller;

  final assetAudioPlayer = new AssetsAudioPlayer();

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);
    final audio = Audio(
      'assets/Breaking-Benjamin-Far-Away.mp3',
      metas: Metas(
        title: "Rock",
        artist: "Breaking Benjamin",
        album: "Aurora",
        image: MetasImage.network(
            'https://s3-us-west-2.amazonaws.com/webstorage-bb/wp-content/uploads/2020/01/aurora_far_away_featured_image_BB.png'), //can be MetasImage.network
      ),
    );
    assetAudioPlayer.open(audio, showNotification: true);
    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.currentTime = duration;
    });
    //Get the song duration

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      margin: EdgeInsets.only(top: 36.0, bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SongTitle(),
          FloatingActionButton(
            onPressed: () {
              final audioPlayerModel =
                  Provider.of<AudioPlayerModel>(context, listen: false);

              if (this.isPlaying) {
                controller.reverse();
                this.isPlaying = false;
                audioPlayerModel.controller.stop();
              } else {
                controller.forward();
                this.isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if (firstTime) {
                this.open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller,
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

    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final percentage = audioPlayerModel.percentage;

    return Container(
      height: 270.0,
      margin: EdgeInsets.only(right: 22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${audioPlayerModel.totalSongDuration}',
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
                height: 230 * percentage,
                width: 3,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
          Text(
            '${audioPlayerModel.currentSecond}',
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
    final audioPlayermodel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: EdgeInsets.all(18.0),
      width: 250.0,
      height: 250.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 10),
              manualTrigger: true,
              controller: (controller) =>
                  audioPlayermodel.controller = controller,
              infinite: true,
              child: Image(
                image: AssetImage('assets/aurora.jpg'),
                fit: BoxFit.cover,
              ),
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
