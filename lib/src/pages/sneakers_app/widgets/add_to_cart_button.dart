import 'package:app_designs/src/pages/sneakers_app/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final double amount;
  AddToCartButton({this.amount});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$amount',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          CustomButton(
            text: 'Buy it now',
          ),
        ],
      ),
      width: double.infinity,
      height: 90.0,
      margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100.0)),
    );
  }
}
