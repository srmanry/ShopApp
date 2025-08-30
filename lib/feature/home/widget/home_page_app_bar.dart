import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';
import 'package:get/get.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const CustomImage(height: 50,width: 50,radius: 100,),

        const SizedBox(width: Dimensions.paddingSizeSmall),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Good Morning 🌅", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).cardColor)),

          const SizedBox(height: Dimensions.paddingSizeTiny),
          Text("HM Fahim", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).cardColor)),
        ],)),

        const SizedBox(width: Dimensions.paddingSizeSmall),
        InkWell(
          onTap: () => Get.toNamed(RouteHelper.getNotificationRoute()),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).cardColor.withOpacity(0.8))
            ),
            child: const Icon(Icons.notifications_none_outlined),
          ),
        )
      ],);
  }
}