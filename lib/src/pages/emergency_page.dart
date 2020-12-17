import 'package:app_designs/src/widgets/fat_button.dart';
import 'package:app_designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FatButton(),
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
