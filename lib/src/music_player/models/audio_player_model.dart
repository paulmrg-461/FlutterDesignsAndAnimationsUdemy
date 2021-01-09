import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _currentTime = new Duration(milliseconds: 0);

  String get totalSongDuration => this.printDuration(this._songDuration);
  String get currentSecond => this.printDuration(this._currentTime);

  double get percentage => (this._songDuration.inSeconds > 0)
      ? this._currentTime.inSeconds / this._songDuration.inSeconds
      : 0;

  AnimationController _controller;

  bool get isPlaying => this._isPlaying;

  set isPlaying(bool isPlaying) {
    this._isPlaying = isPlaying;
    this.notifyListeners();
  }

  Duration get songDuration => this._songDuration;

  set songDuration(Duration songDuration) {
    this._songDuration = songDuration;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Duration get currentTime => this._currentTime;

  set currentTime(Duration currentTime) {
    this._currentTime = currentTime;
    notifyListeners();
  }

  AnimationController get controller => this._controller;

  set controller(AnimationController controller) {
    this._controller = controller;
  }
}
