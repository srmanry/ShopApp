import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImage(radius: 100, width: Get.width*0.3, height: Get.width*0.3),

              const SizedBox(height: Dimensions.paddingSizeDefault,),
              Text("${"welcome".tr} jon!",style: textBold.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: Dimensions.fontSizeOverLarge)),

              const SizedBox(height: Dimensions.paddingSizeDefault,),
              Text("welcome_subTitle".tr, textAlign: TextAlign.center,
                style: textRegular.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: Dimensions.fontSizeDefault,
              ),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: const EdgeInsets.all(Dimensions.paddingSize),
        child: CustomButton(onTap: () => Get.offAllNamed(RouteHelper.getHomeRoute()),
            text: "letsExplore".tr)),
    );
  }
}
