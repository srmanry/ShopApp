import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';


class FavouriteButton extends StatelessWidget {
  final int? productId;
  const FavouriteButton({super.key,  this.productId});

  @override
  Widget build(BuildContext context) {

    return Container(width: 40, height: 40,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.125), spreadRadius: 1, blurRadius: 1, offset: const Offset(0,0))]
      ),
      child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Icon( CupertinoIcons.heart_fill,
            color: Theme.of(context).primaryColor, size: 25),
      ),
    );
  }
}
