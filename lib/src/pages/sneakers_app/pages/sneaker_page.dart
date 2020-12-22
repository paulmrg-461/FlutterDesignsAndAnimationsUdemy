import 'package:app_designs/src/pages/sneakers_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class SneakerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(text: 'For you', icon: Icons.search),
          SneakerSizePreview()
        ],
      ),
    );
  }
}
