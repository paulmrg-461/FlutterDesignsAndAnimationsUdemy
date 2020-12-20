import 'package:app_designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _NewListButton())
      ],
    ));
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      child: RaisedButton(
        onPressed: () => print('Hola amiguis Tolis'),
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0))),
        child: Container(
          padding: EdgeInsets.only(top: 32.0, bottom: 36.0),
          child: Text(
            'CREATE NEW LIST',
            style:
                TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 3),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Deep Purple', Colors.deepPurple),
    _ListItem('Deep Orange', Colors.deepOrange),
    _ListItem('Teal', Colors.teal),
    _ListItem('Amber', Colors.amber),
    _ListItem('Cyan', Colors.cyan),
    _ListItem('Red', Colors.red),
    _ListItem('Blue', Colors.blue),
    _ListItem('Pink', Colors.pink),
  ];

  final double maxHeight = 280;
  final double minHeight = 130;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minHeight: this.minHeight,
              maxHeight: this.maxHeight,
              child: GradientWaveHeader(
                title: 'To Do \nList',
                headerHeight: this.maxHeight,
                fontColor: Colors.white,
                fontSize: 36.0,
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(
              height: 100.0,
            )
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (maxHeight > minHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        maxHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

/* class _ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
} */

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        this.title,
        style: TextStyle(
            fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      height: 130,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(22.0)),
    );
  }
}
