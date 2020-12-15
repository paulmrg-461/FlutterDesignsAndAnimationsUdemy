import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool menuIsActive;
  final Color menuBackgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.menuIsActive = true,
    this.menuBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.blue,
    this.unselectedItemColor = Colors.blueGrey,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Builder(
        builder: (BuildContext context) {
          Provider.of<_MenuModel>(context).menuBackgroundColor =
              this.menuBackgroundColor;
          Provider.of<_MenuModel>(context).selectedItemColor =
              this.selectedItemColor;
          Provider.of<_MenuModel>(context).unselectedItemColor =
              this.unselectedItemColor;

          return AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: menuIsActive ? 1 : 0,
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({@required this.child});
  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModel>(context);
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: menuModelProvider._menuBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                //offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModel>(context);
    final bool isSelected =
        menuModelProvider.selectedItem == index ? true : false;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: isSelected ? 34 : 26,
          color: isSelected
              ? menuModelProvider.selectedItemColor
              : menuModelProvider.unselectedItemColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _selectedItemColor = Colors.black;
  Color _unselectedItemColor = Colors.blueGrey;
  Color _menuBackgroundColor = Colors.white;

  int get selectedItem => this._selectedItem;
  set selectedItem(int selectedItem) {
    this._selectedItem = selectedItem;
    notifyListeners();
  }

  Color get selectedItemColor => this._selectedItemColor;
  set selectedItemColor(Color selectedItemPrimaryColor) {
    this._selectedItemColor = selectedItemPrimaryColor;
    //notifyListeners();
  }

  Color get unselectedItemColor => this._unselectedItemColor;
  set unselectedItemColor(Color selectedItemSecondaryColor) {
    this._unselectedItemColor = selectedItemSecondaryColor;
    //notifyListeners();
  }

  Color get menuBackgroundColor => this._menuBackgroundColor;
  set menuBackgroundColor(Color menuBackgroundColor) {
    this._menuBackgroundColor = menuBackgroundColor;
    //notifyListeners();
  }
}
