import 'package:app_designs/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel extends ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => this._currentPage;

  set currentPage(Widget currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
