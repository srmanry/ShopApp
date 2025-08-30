import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/helper/app_helper.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthScreenAppBar(
        title: "${"otpCodeVerification".tr} 🔒",
        subTitle: "createNewPasswordSubTitle".tr,
      ),

      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
          children: [

            const SizedBox(height: Dimensions.paddingSize,),
            CustomTextField(
              title: "newPassword".tr,hintText: "newPassword".tr,
              filled: true, showBorder: false,
              isPassword: true,
              prefixIcon: Images.lockIconSvg,
              prefixIconSize: 20,
              prefixIconColor: Theme.of(context).colorScheme.onSecondary,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            const SizedBox(height: Dimensions.paddingSize,),
            CustomTextField(
              title: "confirmNewPassword".tr,hintText: "confirmNewPassword".tr,
              filled: true, showBorder: false,
              isPassword: true,
              prefixIcon: Images.lockIconSvg,
              prefixIconSize: 20,
              prefixIconColor: Theme.of(context).colorScheme.onSecondary,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            const SizedBox(height: Dimensions.paddingSize,),




          ]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
        child: CustomButton(onTap: () async => await AppHelper.customSuccessDialog(title: "resetPasswordSuccessful".tr,
          onRoute: () => Get.toNamed(RouteHelper.getSignInRoute()),topImage: Images.passResetImageSvg), height: 45, text: 'saveNewPassword'.tr),
      ),
    );
  }
}
