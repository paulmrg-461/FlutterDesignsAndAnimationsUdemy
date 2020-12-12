import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => this._currentPage;

  Color get primaryColor => this._primaryColor;
  Color get secondaryColor => this._secondaryColor;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
    notifyListeners();
  }

  set secondaryColor(Color secondaryColor) {
    this._secondaryColor = secondaryColor;
    notifyListeners();
  }
}
