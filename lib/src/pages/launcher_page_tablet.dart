import 'package:app_designs/src/pages/slideshow_page.dart';
import 'package:app_designs/src/theme/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_designs/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: Text('Tablet Flutter Designs'),
      ),
      drawer: _MainMenu(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: themeProvider.canvasColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(4, 6),
                    blurRadius: 10.0)
              ],
            ),
            child: _OptionsList(),
          ),
          Expanded(
            child: SlideshowPage(),
          )
        ],
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: themeProvider.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: themeProvider.accentColor,
        ),
        title: Text(pageRoutes[i].title),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: themeProvider.accentColor,
        ),
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (BuildContext context) => pageRoutes[i].page)),
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(22.0),
                width: double.infinity,
                height: 200.0,
                //color: Colors.deepPurple,
                child: CircleAvatar(
                  backgroundColor:
                      themeChangerProvider.currentTheme.accentColor,
                  child: Text(
                    'PR',
                    style: TextStyle(fontSize: 50.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _OptionsList(),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.lightbulb,
                color: themeChangerProvider.currentTheme.accentColor,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: themeChangerProvider.currentTheme.accentColor,
                  value: themeChangerProvider.darkTheme,
                  onChanged: (value) => themeChangerProvider.darkTheme = value),
            ),
            SafeArea(
              top: false,
              bottom: true,
              left: false,
              right: false,
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.userEdit,
                  color: themeChangerProvider.currentTheme.accentColor,
                ),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor: themeChangerProvider.currentTheme.accentColor,
                    value: themeChangerProvider.customTheme,
                    onChanged: (value) =>
                        themeChangerProvider.customTheme = value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
