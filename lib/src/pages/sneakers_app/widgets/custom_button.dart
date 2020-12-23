import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  CustomButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: Color(0xffF1A23A), borderRadius: BorderRadius.circular(100)),
    );
  }
}
