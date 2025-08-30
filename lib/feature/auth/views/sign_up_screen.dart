import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthScreenAppBar(
        title: "${"createAnAccount".tr} 👨‍💻",
        subTitle: "createAnAccountSubtitle".tr,
      ),

      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeLarge),
          children: [
            CustomTextField(
              title: "email".tr,hintText: "email".tr,
              filled: true, showBorder: false,
              prefixIcon: Images.mailIconSvg,
              inputType: TextInputType.emailAddress,
              prefixIconColor: Theme.of(context).colorScheme.onSecondary,
              prefixIconSize: 16,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            const SizedBox(height: Dimensions.paddingSize,),
            CustomTextField(
              title: "password".tr,hintText: "password".tr,
              filled: true, showBorder: false,
              isPassword: true,
              prefixIcon: Images.lockIconSvg,
              prefixIconSize: 20,
              prefixIconColor: Theme.of(context).colorScheme.onSecondary,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            const SizedBox(height: Dimensions.paddingSize,),
            CustomTextField(
              title: "referralCodeOptional".tr,hintText: "referralCode".tr,
              filled: true, showBorder: false,
              inputType: TextInputType.emailAddress,
              fillColor: Theme.of(context).hintColor.withOpacity(0.1),
            ),

            const SizedBox(height: Dimensions.paddingSizeLarge,),
            Row(
              children: [
                Transform.translate(
                  offset: const Offset(-14, 0),
                  child: Checkbox(value: true, onChanged: (value) {},
                    activeColor: Theme.of(context).primaryColor, checkColor: Theme.of(context).cardColor,
                    side: BorderSide(color: Theme.of(context).primaryColor,width: 2),
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: RichText(text: TextSpan(text: "iAgreeToFlight".tr,
                          style: textMedium.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: Dimensions.fontSizeDefault),
                          children: [
                            const TextSpan(text: " ",),
                            TextSpan(text: "termsCondition".tr,
                                style: textMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeDefault),
                                recognizer: TapGestureRecognizer()..onTap = (){
                                  //Get.toNamed(RouteHelper.getSignUpRoute())

                                }
                            )
                          ]
                      )),),
                ),
              ],
            ),

            const SizedBox(height: Dimensions.paddingSizeDefault,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraLarge),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
                    bottom: BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)))),
              alignment: Alignment.center,
              child: RichText(text: TextSpan(text: "alreadyHaveAnAccount".tr,
                  style: textMedium.copyWith(color: Theme.of(context).colorScheme.secondary),
                  children: [
                    const TextSpan(text: " ",),
                    TextSpan(text: "signIn".tr,
                        style: textSemiBold.copyWith(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()..onTap = ()=> Get.toNamed(RouteHelper.getSignInRoute())
                    )
                  ]
              )),
            )

          ]),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSize),
        child: CustomButton(onTap: () async => Get.toNamed(RouteHelper.getCollectInformationRoute()),
            text: "signUp".tr,height: 45),
      ),
    );
  }
}
