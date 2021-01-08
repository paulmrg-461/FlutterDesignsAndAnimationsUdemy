import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final IconData icon;

  CustomAppBar({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0),
        child: Container(
          margin: EdgeInsets.only(top: 28),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Icon(
                this.icon,
                size: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}
