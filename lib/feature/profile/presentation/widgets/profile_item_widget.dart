import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';


class TitleButton extends StatelessWidget {
  final String icon;
  final String title;
  final Widget navigateTo;
  final bool isNotification;
  final bool isProfile;
  final Function()? onTap;
  const TitleButton({super.key, required this.icon, required this.title, required this.navigateTo,
    this.isNotification = false, this.isProfile = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(onTap :onTap,
        child: Container(decoration: BoxDecoration(color: Theme.of(context).cardColor,
        boxShadow: ThemeShadow.getShadow()),
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
          child: Row(children: [
             Image.asset(icon, width: 25, height: 25, fit: BoxFit.fill),
            const SizedBox(width: Dimensions.paddingSizeSmall,),
            Expanded(child: Text(title.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge))),
            Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).hintColor, size: 18)
          ]),
        ),
      ),
    );
  }
}