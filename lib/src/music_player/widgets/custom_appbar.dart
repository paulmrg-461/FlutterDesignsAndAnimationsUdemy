import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.chevronLeft),
              splashColor: Colors.amber.withOpacity(0.25),
            ),
            _RightIcons()
          ],
        ),
      ),
    );
  }
}

class _RightIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.commentAlt),
          splashColor: Colors.amber.withOpacity(0.25),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.headphonesAlt),
          splashColor: Colors.amber.withOpacity(0.25),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.externalLinkAlt),
          splashColor: Colors.amber.withOpacity(0.25),
        ),
      ],
    );
  }
}
