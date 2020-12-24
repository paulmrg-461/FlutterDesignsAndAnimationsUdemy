import 'package:app_designs/src/pages/sneakers_app/pages/sneaker_description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textButtonColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;

  CustomButton(
      {@required this.text,
      this.buttonColor = Colors.orange,
      this.textButtonColor = Colors.white,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.horizontalPadding = 16.0,
      this.verticalPadding = 12.0,
      this.borderRadius = 100.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (BuildContext context) => SneakerDescriptionPage())),
      child: Container(
        child: Text(
          this.text,
          style: TextStyle(
              color: this.textButtonColor,
              fontSize: this.fontSize,
              fontWeight: this.fontWeight),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: this.horizontalPadding, vertical: this.verticalPadding),
        decoration: BoxDecoration(
          color: this.buttonColor,
          borderRadius: BorderRadius.circular(this.borderRadius),
          /*  boxShadow: [
              BoxShadow(
                  color: Colors.black, blurRadius: 60.0, offset: Offset(0, 15))
            ] */
        ),
      ),
    );
  }
}
