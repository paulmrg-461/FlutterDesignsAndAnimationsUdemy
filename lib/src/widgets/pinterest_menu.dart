import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool menuIsActive;
  PinterestMenu({this.menuIsActive = true});

  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart, onPressed: () => print('Icon pie chart...')),
    PinterestButton(
        icon: Icons.search, onPressed: () => print('Icon search...')),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () => print('Icon notifications...')),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () => print('Icon user circle...')),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: menuIsActive ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
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
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;
    final bool isSelected = selectedItem == index ? true : false;

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
          color: isSelected ? Colors.deepPurple : Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;

  int get selectedItem => this._selectedItem;
  set selectedItem(int selectedItem) {
    this._selectedItem = selectedItem;
    notifyListeners();
  }
}
