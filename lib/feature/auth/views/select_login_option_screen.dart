import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class SelectLoginOptionScreen extends StatelessWidget {
  const SelectLoginOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault).copyWith(top: Dimensions.paddingSizeLarge),
            children: [
              const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
              CircleAvatar(radius: 50,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.flight_takeoff_rounded,size: 70,color: Theme.of(context).cardColor,)),

              const SizedBox(height: Dimensions.paddingSizeSignUp,),
              Center(child: Text("Flight",style: textBold.copyWith(fontSize: 30,color: Theme.of(context).colorScheme.secondary ,))),

              const SizedBox(height: Dimensions.paddingSize,),
              Center(child: Text("letsDive".tr,textAlign: TextAlign.center, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).colorScheme.onSecondary,))),

              const SizedBox(height: Dimensions.paddingSizeOverLarge,),
              CustomOutlineButton(onPressed: () {}, title: "continueWithGoogle",icon: Images.googleIconSvg,),
              CustomOutlineButton(onPressed: () {}, title: "continueWithApple",icon: Images.appleIconSvg,),
              CustomOutlineButton(onPressed: () {}, title: "continueWithFacebook",icon: Images.facebookIconSvg,),
              CustomOutlineButton(onPressed: () {}, title: "continueWithTwitter",icon: Images.twitterIconSvg,),

              const SizedBox(height: Dimensions.paddingSizeOverLarge,),
              CustomButton(onTap: () => Get.toNamed(RouteHelper.getSignInRoute()),height: 45, text: "signInWithPassword".tr),

              const SizedBox(height: Dimensions.paddingSizeOverLarge,),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(text: TextSpan(text: "donHaveAnAccount".tr,
                    style: Get.textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary),
                    children: [
                      const TextSpan(text: " ",),
                      TextSpan(text: "signUp".tr,
                          style: textSemiBold.copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()..onTap = ()=>Get.toNamed(RouteHelper.getSignUpRoute())
                      )
                    ]
                )),
              ),
            ]),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final String? icon;
  const CustomOutlineButton({
    super.key, this.onPressed, required this.title, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OutlinedButton(onPressed: () {},
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal:Dimensions.paddingSizeDefault,vertical:Dimensions.paddingSize  )),
              side: MaterialStatePropertyAll(BorderSide(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5))),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
          child: Row(children: [
            if(icon != null)
            SvgPicture.asset(icon!,height: 22,),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(title.tr,textAlign: TextAlign.center,style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).colorScheme.secondary),),
            ))
          ],)),
    );
  }
}
