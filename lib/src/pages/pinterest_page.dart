import 'package:app_designs/src/theme/theme_changer.dart';
import 'package:app_designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [PinterestGrid(), _PinterestMenuLocation()],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuIsActiveProvider = Provider.of<_MenuModel>(context)._menuIsActive;
    final themeChangerProvider = Provider.of<ThemeChanger>(context);
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
        bottom: 30.0,
        child: Container(
            width: screenSize.width,
            child: Align(
                child: PinterestMenu(
              menuIsActive: menuIsActiveProvider,
              menuBackgroundColor: themeChangerProvider.darkTheme
                  ? themeChangerProvider.currentTheme.scaffoldBackgroundColor
                  : Colors.white,
              selectedItemColor: themeChangerProvider.darkTheme
                  ? themeChangerProvider.currentTheme.accentColor
                  : Colors.deepPurple,
              unselectedItemColor: themeChangerProvider.darkTheme
                  ? Colors.grey
                  : Colors.blueGrey,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () => print('Icon pie chart...')),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () => print('Icon search...')),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () => print('Icon notifications...')),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () => print('Icon user circle...')),
              ],
            ))));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double lastScroll = 0;
  final providerMenuIsActive = true;

  @override
  void initState() {
    controller.addListener(() {
      /* (controller.offset > lastScroll)
          ? print('Hide menu')
          : print('Show menu');
      lastScroll = controller.offset; */
      if (controller.offset > lastScroll && controller.offset > 150.0) {
        Provider.of<_MenuModel>(context, listen: false).menuIsActive = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).menuIsActive = true;
      }
      lastScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _menuIsActive = true;

  bool get menuIsActive => this._menuIsActive;
  set menuIsActive(bool menuIsActive) {
    this._menuIsActive = menuIsActive;
    notifyListeners();
  }
}
