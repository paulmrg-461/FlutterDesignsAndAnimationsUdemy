import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => this._darkTheme;
  set darkTheme(bool darkTheme) {
    this._customTheme = false;
    this._darkTheme = darkTheme;
    notifyListeners();
  }

  bool get customTheme => this._customTheme;
  set customTheme(bool customTheme) {
    this._darkTheme = false;
    this._customTheme = customTheme;
    notifyListeners();
  }
}
