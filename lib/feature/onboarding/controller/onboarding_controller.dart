import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/images.dart';


class OnboardingController extends GetxController implements GetxService{
  final SharedPreferences sharedPreferences;
  OnboardingController({required this.sharedPreferences});

   PageController pageController = PageController();
   PageController pageController2 = PageController();

   int currentPage = 0;

   void setCurrentPage(int index){
     currentPage = index;
     update();
   }

  void nextPage() {
    if((currentPage+1) == onboardingData.length){
       skipAllPage();
       return;
     }
    pageController.nextPage(duration: const Duration(milliseconds: 500,), curve: Curves.easeIn);
    pageController2.nextPage(duration: const Duration(milliseconds: 500,), curve: Curves.easeIn);
  }

  void skipAllPage() async{
  //  await sharedPreferences.setBool(AppConstants.skipOnboard, true);
    await Get.offAllNamed(RouteHelper.dashboardScreen);
    pageController.dispose();
    pageController2.dispose();
  }



  List<OnBoardingModel> onboardingData = [
    OnBoardingModel(Images.p1, "onboard_title_1".tr, "onboard_sub_title".tr),
    OnBoardingModel(Images.p2, "onboard_title_2".tr, "onboard_sub_title".tr),
    OnBoardingModel(Images.p3, "onboard_title_3".tr, "onboard_sub_title".tr),

  ];
}
class OnBoardingModel{
  String image;
  String title;
  String subTitle;

  OnBoardingModel(this.image, this.title, this.subTitle);
}