import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class CartWidgetHomePage extends StatelessWidget {
  const CartWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        IconButton(onPressed: (){},
          icon: Stack(clipBehavior: Clip.none, children: [
            Image.asset(Images.notification, height: Dimensions.iconSizeDefault, width: Dimensions.iconSizeDefault, color: Theme.of(context).primaryColor),
            Positioned(top: -4, right: -4,
              child: CircleAvatar(radius: 7, backgroundColor: Theme.of(context).colorScheme.error,
                child: Text('0', style: textBold.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeExtraSmall)),)),])),

        Padding(padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(onPressed: () {},
            icon: Stack(clipBehavior: Clip.none, children: [
              Image.asset(Images.cart, height: Dimensions.iconSizeDefault, width: Dimensions.iconSizeDefault, color: Theme.of(context).primaryColor),
              Positioned(top: -4, right: -4,
                child: CircleAvatar(radius: 7, backgroundColor: Theme.of(context).colorScheme.error,
                  child: Text("1", style: textSemiBold.copyWith(color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeExtraSmall,)),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
