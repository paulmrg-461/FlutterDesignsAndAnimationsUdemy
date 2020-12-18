import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs'),
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.deepPurple,
      ),
      itemCount: 10,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.deepPurple,
        ),
        title: Text('Hola Amiguis'),
        trailing: FaIcon(
          FontAwesomeIcons.chevronRight,
          color: Colors.deepPurple,
        ),
        onTap: () {},
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Colors.deepPurple,
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
                color: Colors.deepPurple,
              ),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.deepPurple,
                value: true,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userEdit,
                color: Colors.deepPurple,
              ),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.deepPurple,
                value: true,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
