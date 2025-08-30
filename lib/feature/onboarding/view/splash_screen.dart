import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';
import 'onboarding_screen.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});
  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();}
class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {whereTogo();super.initState();}

  Future<void> whereTogo() async {Future.delayed( const Duration(seconds: 8), () {
  Get.to(const OnboardScreen());},); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body: Center( child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: const AssetImage("assets/image/logo.png"),color: Theme.of(context).cardColor,),

            const SizedBox(height: Dimensions.paddingSizeDefault,),
            Text("joyRide".tr,style: textBold.copyWith(fontSize: Dimensions.fontSizeOverLarge,color: Theme.of(context).cardColor)),
          ],
        ),
      ),
    );
  }
}
