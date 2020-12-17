import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;
  final Color primaryColor;
  final Color gradientColor1;
  final Color gradientColor2;

  FatButton(
      {@required this.icon,
      @required this.title,
      @required this.onPressed,
      this.primaryColor = Colors.white,
      this.gradientColor1 = Colors.deepPurple,
      this.gradientColor2 = Colors.purpleAccent});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _FatButtonModel(),
        child: Builder(builder: (BuildContext context) {
          Provider.of<_FatButtonModel>(context).icon = this.icon;
          Provider.of<_FatButtonModel>(context).title = this.title;
          Provider.of<_FatButtonModel>(context).primaryColor =
              this.primaryColor;
          Provider.of<_FatButtonModel>(context).gradientColor1 =
              this.gradientColor1;
          Provider.of<_FatButtonModel>(context).gradientColor2 =
              this.gradientColor2;
          return GestureDetector(
              onTap: this.onPressed, child: _FatButtonBackground());
        }));
  }
}

class _FatButtonBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fatButtonProvider = Provider.of<_FatButtonModel>(context);
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [_TransparentRightIcon(), _ButtonInformation()],
        ),
      ),
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(4, 6),
                blurRadius: 10.0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          gradient: LinearGradient(colors: <Color>[
            fatButtonProvider.gradientColor1,
            fatButtonProvider.gradientColor2,
            /* Color(0xff6989F5),
            Color(0xff906EF5), */
          ])),
    );
  }
}

class _ButtonInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fatButonProvider = Provider.of<_FatButtonModel>(context);
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FaIcon(
                  fatButonProvider.icon,
                  color: Colors.white,
                  size: 36.0,
                ),
                SizedBox(
                  width: 14.0,
                ),
                Text(
                  fatButonProvider.title,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ],
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class _TransparentRightIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fatButtonProvider = Provider.of<_FatButtonModel>(context);
    return Positioned(
      right: -20.0,
      top: -20.0,
      child: FaIcon(
        fatButtonProvider.icon,
        size: 150.0,
        color: fatButtonProvider.primaryColor.withOpacity(0.2),
      ),
    );
  }
}

class _FatButtonModel with ChangeNotifier {
  IconData _icon = FontAwesomeIcons.android;
  String _title = 'Title';
  Color _primaryColor = Colors.white;
  Color _gradientColor1 = Colors.deepPurple;
  Color _gradientColor2 = Colors.purpleAccent;

  IconData get icon => this._icon;
  set icon(IconData icon) {
    this._icon = icon;
  }

  String get title => this._title;
  set title(String title) {
    this._title = title;
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get gradientColor1 => this._gradientColor1;
  set gradientColor1(Color gradientColor1) {
    this._gradientColor1 = gradientColor1;
  }

  Color get gradientColor2 => this._gradientColor2;
  set gradientColor2(Color gradientColor2) {
    this._gradientColor2 = gradientColor2;
  }
}