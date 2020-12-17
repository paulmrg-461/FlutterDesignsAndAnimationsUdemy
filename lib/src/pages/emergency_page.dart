import 'package:app_designs/src/widgets/fat_button.dart';
import 'package:app_designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HeaderWidget(),
          SizedBox(
            height: 12.0,
          ),
          FatButton(
            icon: FontAwesomeIcons.carCrash,
            title: 'Motor Accident',
            onPressed: () => print('Hola amiguis'),
            gradientColor1: Color(0xff6989F5),
            gradientColor2: Color(0xff906EF5),
          ),
          FatButton(
            icon: FontAwesomeIcons.apple,
            title: 'Apple Tola',
            onPressed: () => print('Hola Apple'),
            gradientColor1: Color(0xff388E3C),
            gradientColor2: Color(0xff4CAF50),
          ),
          FatButton(
            icon: FontAwesomeIcons.angry,
            title: 'Los voy a matar a todos',
            onPressed: () => print('Hola los voy a matar'),
          ),
        ],
      ),
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
