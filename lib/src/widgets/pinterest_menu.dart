import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
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
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () => print('Icon user circle...')),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: _MenuItems(items),
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
    ));
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
    return Container(
      child: Icon(item.icon),
    );
  }
}
