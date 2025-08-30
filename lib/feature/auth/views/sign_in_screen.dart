import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/helper/app_helper.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAuthScreenAppBar(
        title: "${"welcomeBack".tr} 👋",
        subTitle: "pleasEnterEmailPasswordToSignIn".tr,
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
                      offset: const Offset(-14, 0),
                      child: Text("Remember me",style: textMedium.copyWith(color: Theme.of(context).colorScheme.secondary),)),
                ),

                InkWell(
                  onTap: () => Get.toNamed(RouteHelper.getForgotPassword()),
                  child: Text("Forgot password?",textAlign: TextAlign.right,
                    style: textSemiBold.copyWith(color: Theme.of(context).primaryColor),),
                )
              ],
            ),

            const SizedBox(height: Dimensions.paddingSizeDefault,),
          const Center(child: Text("or")),
            const SizedBox(height: Dimensions.paddingSizeDefault,),

            const CustomOutLineBottom(bottomText: "Continue with Google",bottomImage: Images.google,),
            const SizedBox(height: Dimensions.twenty,),

            const CustomOutLineBottom(bottomText: "Continue with Facebook",bottomImage: Images.facebook,),
            const SizedBox(height: Dimensions.twenty,),

            const CustomOutLineBottom(bottomText: "      Continue with X      ",bottomImage: Images.x,),
            const SizedBox(height: Dimensions.twenty,),

          ]),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSize),
        child: CustomButton(onTap: () async => await AppHelper.customSuccessDialog(title: "signInSuccessful".tr,
        onRoute: () => Get.offAllNamed(RouteHelper.getDashboardRoute()),
        ),
            text: "signIn".tr,height: 45),
      ),
    );
  }
}
