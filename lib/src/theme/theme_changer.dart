import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        //_currentTheme = ThemeData.dark();
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool darkTheme) {
    this._customTheme = false;
    this._darkTheme = darkTheme;

    _currentTheme = darkTheme ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  set customTheme(bool customTheme) {
    this._darkTheme = false;
    this._customTheme = customTheme;
    _currentTheme = customTheme ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}
