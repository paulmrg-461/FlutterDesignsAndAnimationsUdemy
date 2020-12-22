import 'package:app_designs/src/pages/sneakers_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class SneakerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(text: 'For you', icon: Icons.search),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SneakerSizePreview(
                    sizes: [
                      SneakerSizeContainer(size: 7),
                      SneakerSizeContainer(size: 7.5),
                      SneakerSizeContainer(size: 8),
                      SneakerSizeContainer(size: 8.5),
                      SneakerSizeContainer(size: 9),
                      SneakerSizeContainer(size: 9.5),
                    ],
                  ),
                  SneakerDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
