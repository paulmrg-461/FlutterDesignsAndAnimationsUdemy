import 'package:flutter/material.dart';
import 'package:app_designs/src/widgets/headers.dart';
import 'package:app_designs/src/widgets/fat_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class ItemButton {
  final IconData icon;
  final String title;
  final Color color1;
  final Color color2;

  ItemButton(this.icon, this.title, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemButton>[
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 350),
              child: FatButton(
                icon: item.icon,
                title: item.title,
                onPressed: () => print('Hola tolos'),
                gradientColor1: item.color1,
                gradientColor2: item.color2,
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 220.0),
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              ...itemMap,
              SizedBox(
                height: 14.0,
              ),
            ]),
          ),
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FatButton(
      icon: FontAwesomeIcons.carCrash,
      title: 'Motor Accident',
      onPressed: () => print('Hola amiguis'),
      gradientColor1: Color(0xff6989F5),
      gradientColor2: Color(0xff906EF5),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'You\'ve requested',
      title: 'Medical Assistance',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
