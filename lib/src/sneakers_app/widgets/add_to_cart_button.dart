import 'package:animate_do/animate_do.dart';
import 'package:app_designs/src/sneakers_app/models/sneaker_model.dart';
import 'package:app_designs/src/sneakers_app/widgets/custom_circular_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'custom_button.dart';

class AddToCartButton extends StatelessWidget {
  final double amount;
  final String textButton;
  final Function onPress;
  final bool isFullScreen;
  final bool animation;
  AddToCartButton(
      {@required this.amount,
      @required this.textButton,
      @required this.onPress,
      this.isFullScreen = false,
      this.animation = false});
  @override
  Widget build(BuildContext context) {
    if (isFullScreen) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            _ValueAndButton(
                amount: this.amount,
                textButton: this.textButton,
                onPress: this.onPress),
            _ColorsAndMore(),
            _Actions()
          ],
        ),
      );
    } else {
      return Container(
        child: _ValueAndButton(
            amount: this.amount,
            textButton: this.textButton,
            onPress: this.onPress,
            animation: this.animation),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100.0)),
      );
    }
  }
}

class _ValueAndButton extends StatelessWidget {
  final double amount;
  final String textButton;
  final Function onPress;
  final bool animation;
  _ValueAndButton(
      {@required this.amount,
      @required this.textButton,
      @required this.onPress,
      this.animation = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$$amount',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        CustomButton(
          text: this.textButton,
          buttonColor: Color(0xffF1A23A),
          horizontalPadding: 22,
          onPress: this.onPress,
          animate: this.animation,
        ),
      ],
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 75,
                    child: _ColorSelection(
                        Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(
                    left: 50,
                    child: _ColorSelection(
                        Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(
                    left: 25,
                    child: _ColorSelection(
                        Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
                _ColorSelection(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),
          CustomButton(
            text: 'More related items',
            buttonColor: Color(0xffF1A23A).withOpacity(0.6),
            verticalPadding: 6,
            horizontalPadding: 24,
            onPress: () => print('More related items'),
          )
        ],
      ),
    );
  }
}

class _ColorSelection extends StatelessWidget {
  final Color color;
  final int index;
  final String urlAssetImage;
  _ColorSelection(this.color, this.index, this.urlAssetImage);
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => Provider.of<SneakerModel>(context, listen: false)
            .urlAssetImage = this.urlAssetImage,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _Actions extends StatefulWidget {
  @override
  __ActionsState createState() => __ActionsState();
}

class __ActionsState extends State<_Actions> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return CustomCircularButton(buttons: [
      CircleButton(
          icon: FontAwesomeIcons.solidHeart,
          iconColor: isLike ? Colors.red : Colors.grey.withOpacity(0.5),
          onPress: () => this.setState(() {
                isLike = !isLike;
              })),
      CircleButton(
          icon: FontAwesomeIcons.shoppingCart,
          iconColor: Colors.grey.withOpacity(0.5),
          onPress: () => print('Holi 2')),
      CircleButton(
          icon: Icons.settings,
          iconSize: 27,
          iconColor: Colors.grey.withOpacity(0.5),
          onPress: () => print('Holi 3')),
    ]);
  }
}
