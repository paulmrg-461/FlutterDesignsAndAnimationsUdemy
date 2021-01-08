import 'package:flutter/material.dart';

class SneakerModel extends ChangeNotifier {
  int _index = 0;
  Color _selectedColor = Color(0xffF1A23A);
  Color _unselectedColor = Colors.white;
  String _urlAssetImage = 'assets/imgs/azul.png';

  int get index => this._index;
  set index(int index) {
    this._index = index;
    this.notifyListeners();
  }

  Color get selectedColor => this._selectedColor;
  set selectedColor(Color selectedColor) {
    this._selectedColor = selectedColor;
  }

  Color get unselectedColor => this._unselectedColor;
  set unselectedColor(Color unselectedColor) {
    this._unselectedColor = unselectedColor;
  }

  String get urlAssetImage => this._urlAssetImage;
  set urlAssetImage(String urlAssetImage) {
    this._urlAssetImage = urlAssetImage;
    this.notifyListeners();
  }
}
