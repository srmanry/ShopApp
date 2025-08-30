import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class OTPVerifyScreen extends StatelessWidget {
  const OTPVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthScreenAppBar(
        title: "${"otpCodeVerification".tr} 🔐",
        subTitle: "resetPasswordSubTitle".tr,
        toolbarHeight: 160,
      ),

      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
          children: [
            SizedBox(height: Get.height*0.08,),

            Pinput(
              length: 4,
              keyboardType: TextInputType.phone,
              defaultPinTheme: PinTheme(
                height: Get.width/6, width: Get.width/6,
                textStyle: textBold.copyWith(color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeOverLarge),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: Get.width/5.9, width: Get.width/5.9,
                textStyle: textBold.copyWith(color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeOverLarge),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: Theme.of(context).primaryColor),
                  boxShadow: [BoxShadow(color:  Theme.of(context).primaryColor.withOpacity(0.16), spreadRadius: 3,)],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),

            const SizedBox(height: Dimensions.paddingSizeLarge,),
            Center(child: Text("dontReceiveEmail".tr, style: textRegular.copyWith(color: Theme.of(context).colorScheme.onSecondary)),),

            const SizedBox(height: Dimensions.paddingSize,),
            Center(
              child: RichText(text: TextSpan(text: "youCanResentCodeIn".tr,
                  style: textRegular.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  children: [
                    const TextSpan(text: " ",),
                    TextSpan(text: "24S",
                        style: textSemiBold.copyWith(color: Theme.of(context).primaryColor),
                    )
                  ]
              )),
            ),

          ]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
        child: CustomButton(onTap: () => Get.toNamed(RouteHelper.getResetPassword()), height: 45, text: 'continue'.tr),
      ),
    );
  }
}
