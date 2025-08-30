import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/localization/localization_controller.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class SearchWidgetHomePage extends StatelessWidget {
  const SearchWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraExtraSmall),
      child: Container(padding:  const EdgeInsets.symmetric(
          horizontal: Dimensions.homePagePadding, vertical: Dimensions.paddingSizeSmall),

        alignment: Alignment.center,
        child: Container(padding: EdgeInsets.only(
          left: Get.find<LocalizationController>().isLtr ? Dimensions.paddingSizeSmall : 2,
            right: Get.find<LocalizationController>().isLtr ? 2 : Dimensions.paddingSizeExtraSmall),
          height: 60, alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow: Get.find<ThemeController>().darkTheme ? null : [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.1), spreadRadius: 1, blurRadius: 1, offset: const Offset(0,0))],
            borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),),
          child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween, children: [

            Text('search_hint'.tr,
                style: textRegular.copyWith(color: Theme.of(context).hintColor)),

            Container(width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall))),
              child: Icon(Icons.search, color: Get.find<ThemeController>().darkTheme ?
              Colors.white : Theme.of(context).cardColor, size: Dimensions.iconSizeDefault),
            ),
          ]),
        ),
      ),
    );
  }
}
