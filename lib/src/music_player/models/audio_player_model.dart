import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool _isPlaying = false;
  AnimationController _controller;

  bool get isPlaying => this._isPlaying;

  set isPlaying(bool isPlaying) {
    this._isPlaying = isPlaying;
    this.notifyListeners();
  }

  AnimationController get controller => this._controller;

  set controller(AnimationController controller) {
    this._controller = controller;
  }
}
