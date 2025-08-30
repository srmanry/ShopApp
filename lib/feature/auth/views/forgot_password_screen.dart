import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthScreenAppBar(
        title: "${"resetYourPassword".tr} 🔑",
        subTitle: "resetPasswordSubTitle".tr,
        toolbarHeight: 160,
      ),

      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
          children: [
            CustomTextField(
              title: "email".tr,hintText: "email".tr,
              filled: true, showBorder: false,
              prefixIcon: Images.mailIconSvg,
              prefixIconColor: Theme.of(context).colorScheme.onSecondary,
              prefixIconSize: 16,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

          ]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
        child: CustomButton(onTap: () => Get.toNamed(RouteHelper.getOTPVerify()), height: 45, text: 'continue'.tr),
      ),
    );
  }
}
