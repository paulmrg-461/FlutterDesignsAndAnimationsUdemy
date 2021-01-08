import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color buttonColor;
  final Color textButtonColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final bool animate;
  final double animationFrom;
  final int animationDelay;
  final int animationDuration;

  CustomButton(
      {@required this.text,
      @required this.onPress,
      this.buttonColor = Colors.orange,
      this.textButtonColor = Colors.white,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.horizontalPadding = 16.0,
      this.verticalPadding = 12.0,
      this.borderRadius = 100.0,
      this.animate = false,
      this.animationFrom = 16.0,
      this.animationDelay = 0,
      this.animationDuration = 1300});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Bounce(
        animate: this.animate,
        from: this.animationFrom,
        delay: Duration(milliseconds: this.animationDelay),
        duration: Duration(milliseconds: this.animationDuration),
        child: Container(
          child: Text(
            this.text,
            style: TextStyle(
                color: this.textButtonColor,
                fontSize: this.fontSize,
                fontWeight: this.fontWeight),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: this.horizontalPadding,
              vertical: this.verticalPadding),
          decoration: BoxDecoration(
            color: this.buttonColor,
            borderRadius: BorderRadius.circular(this.borderRadius),
            /*  boxShadow: [
                BoxShadow(
                    color: Colors.black, blurRadius: 60.0, offset: Offset(0, 15))
              ] */
          ),
        ),
      ),
    );
  }
}
