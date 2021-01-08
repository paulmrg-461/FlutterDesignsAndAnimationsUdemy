import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircleButton {
  final IconData icon;
  final Function onPress;
  final double iconSize;
  final Color iconColor;

  CircleButton(
      {@required this.icon,
      @required this.onPress,
      this.iconSize = 20,
      this.iconColor = Colors.grey});
}

class CustomCircularButton extends StatelessWidget {
  final List<CircleButton> buttons;

  CustomCircularButton({@required this.buttons});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(buttons.length,
            (index) => _CustomCircularButtonContainer(index, buttons[index])),
      ),
    );
  }
}

class _CustomCircularButtonContainer extends StatelessWidget {
  final int index;
  final CircleButton button;

  _CustomCircularButtonContainer(this.index, this.button);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.button.onPress,
      child: Container(
        child: Center(
            child: FaIcon(
          this.button.icon,
          size: this.button.iconSize,
          color: this.button.iconColor,
        )),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  spreadRadius: -5,
                  blurRadius: 20.0,
                  offset: Offset(0.0, 5)),
            ]),
      ),
    );
  }
}
