import 'package:app_designs/src/sneakers_app/helpers/helpers.dart';
import 'package:app_designs/src/sneakers_app/widgets/add_to_cart_button.dart';
import 'package:app_designs/src/sneakers_app/widgets/sneaker_description.dart';
import 'package:app_designs/src/sneakers_app/widgets/sneaker_size_preview.dart';
import 'package:flutter/material.dart';

class SneakerDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeLightStatusBar();

    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: [
            Hero(
              tag: 'sneaker-1',
              child: SneakerSizePreview(
                height: 385.0,
                horizontalPadding: 4.0,
                verticalPadding: 4.0,
                topLeftRadius: 16,
                topRightRadius: 16,
              ),
            ),
            IconButton(
              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 8),
              icon: Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 48,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SneakerDescription(
                    verticalPadding: 16.0,
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                AddToCartButton(
                  amount: 180.0,
                  textButton: 'Buy now',
                  isFullScreen: true,
                  onPress: () => print('Now in Sneaker Description Page!'),
                  animation: true,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
