import 'package:app_designs/src/pages/sneakers_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class SneakerDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SneakerSizePreview(
          height: 390.0,
          horizontalPadding: 4.0,
          verticalPadding: 4.0,
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
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
