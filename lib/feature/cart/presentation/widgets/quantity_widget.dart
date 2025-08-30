
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {

  final bool isIncrement;
  final int? quantity;
  final int index;
  final int? maxQty;
  final int? minimumOrderQuantity;

  const QuantityButton({super.key, required this.isIncrement, required this.quantity, required this.index,
    required this.maxQty, this.minimumOrderQuantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Icon(isIncrement ? CupertinoIcons.add : quantity! == minimumOrderQuantity!? CupertinoIcons.delete_solid : CupertinoIcons.minus,
          color: Colors.red, size:  15),
    );
  }
}