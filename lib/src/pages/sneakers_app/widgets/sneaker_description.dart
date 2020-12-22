import 'package:flutter/material.dart';

class SneakerDescription extends StatelessWidget {
  final String title;
  final String description;

  SneakerDescription({@required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Text(
              this.description,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                  height: 1.6,
                  letterSpacing: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
