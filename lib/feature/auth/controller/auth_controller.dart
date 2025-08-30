import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/feature/auth/model/air_lines_model.dart';
import 'package:test_project/feature/auth/model/collect_information_ui_model.dart';
import 'package:test_project/feature/auth/model/dine_model.dart';
import 'package:test_project/feature/auth/model/jour_location_model.dart';
import 'package:test_project/feature/auth/widget/dine_tour_way_widget.dart';
import 'package:test_project/feature/auth/widget/fly_your_way_widget.dart';
import 'package:test_project/feature/auth/widget/set_pin_widget.dart';
import 'package:test_project/feature/auth/widget/terms_and_conditions_widget.dart';
import 'package:test_project/feature/auth/widget/touch_your_profile.dart';
import 'package:test_project/helper/route_helper.dart';

import '../widget/tailor_your_jour_widget.dart';

class AuthController extends GetxController implements GetxService{


  PageController cIPPageController = PageController();
  int selectCIPIndex = 0;

  List<CollectInformationUIModel> collectInformationPages = [
    CollectInformationUIModel(
        title: "${"touchYourProfile".tr} 👤",
        subTitle: "touchYourProfileSubTitle".tr,
        child: const TouchYourProfileWidget()
    ),
    CollectInformationUIModel(
        title: "${"tailorYourJour".tr} 🏖️",
        subTitle: "tailorYourJourSubTitle".tr,
        child: const TailorYourJourWidget()
    ),
    CollectInformationUIModel(
        title: "${"dineYourWay".tr} 🌮",
        subTitle: "dineYourWaySubTitle".tr,
        child: const DineYourWayWidget()
    ),
    CollectInformationUIModel(
        title: "${"flyYouWay".tr} ✈️",
        subTitle: "flyYouWaySubTitle".tr,
        child: const FlyYourWayWidget()
    ),
    CollectInformationUIModel(
        title: "${"termsAndConditions".tr} 🗒️",
        subTitle: "termsAndConditionsSubtitle".tr,
        child: const TermsAndConditionsWidget()
    ),
    CollectInformationUIModel(
        title: "${"setYourPIN".tr} 🔒",
        subTitle: "setYourPINSubTitle".tr,
        child: const SetPINWidget()
    ),
  ];

  List<JourLocationModel> locations = [
    JourLocationModel(placeName: "Paris", ),
    JourLocationModel(placeName: "Rio de Janeiro", ),
    JourLocationModel(placeName: "Amsterdam", ),
    JourLocationModel(placeName: "Singapore", ),
    JourLocationModel(placeName: "London", ),
    JourLocationModel(placeName: "Hong Kong", ),
    JourLocationModel(placeName: "Rome", ),
    JourLocationModel(placeName: "Maui, Hawaii", ),
    JourLocationModel(placeName: "Barcelona", ),
    JourLocationModel(placeName: "Marrakech", ),
    JourLocationModel(placeName: "Tokyo", ),
    JourLocationModel(placeName: "Los Angeles", ),
    JourLocationModel(placeName: "Prague", ),
    JourLocationModel(placeName: "New York", ),
    JourLocationModel(placeName: "Sydney", ),
    JourLocationModel(placeName: "Bangkok", ),
    JourLocationModel(placeName: "Istanbul", ),
    JourLocationModel(placeName: "Dubai", ),
    JourLocationModel(placeName: "Cape Town", ),
    JourLocationModel(placeName: "Budapest", ),
    JourLocationModel(placeName: "Vancouver", ),
    JourLocationModel(placeName: "Kyoto", ),
    JourLocationModel(placeName: "Cairo", ),
    JourLocationModel(placeName: "Vienna", ),
    JourLocationModel(placeName: "Milan", ),
    JourLocationModel(placeName: "Melbourne", ),
    JourLocationModel(placeName: "Lisbon", ),
    JourLocationModel(placeName: "Seoul", ),
    JourLocationModel(placeName: "Athens", ),
    JourLocationModel(placeName: "Bali", )
  ];

  List<DineModel> dineData = [
    DineModel(name: "Vegetarian",),
    DineModel(name: "Vegan",),
    DineModel(name: "Gluten-Free",),
    DineModel(name: "Dairy-Free",),
    DineModel(name: "Nut-Free",),
    DineModel(name: "Pescatarian",),
    DineModel(name: "Seafood Lover",),
    DineModel(name: "Halal",),
    DineModel(name: "Japanese",),
    DineModel(name: "American",),
    DineModel(name: "Mediterranean",),
    DineModel(name: "Low-Fat",),
    DineModel(name: "Mexican",),
    DineModel(name: "Low-Carb",),
    DineModel(name: "Kosher",),
    DineModel(name: "Paleo",),
    DineModel(name: "Keto",),
    DineModel(name: "Vegetarian Plus",),
    DineModel(name: "Indian",),
    DineModel(name: "Chinese",),
    DineModel(name: "Italian",),
    DineModel(name: "French",),
    DineModel(name: "Thai",),
    DineModel(name: "Vegan Plus",),
    DineModel(name: "Sugar-Free",),
    DineModel(name: "High-Protein",),
  ];

  List<AirLinesModel> airlines = [
    AirLinesModel(name: "Emirates",),
    AirLinesModel(name: "Delta Air Lines",),
    AirLinesModel(name: "Lufthansa", ),
    AirLinesModel(name: "American Airlines", ),
    AirLinesModel(name: "United Airlines",),
    AirLinesModel(name: "Qatar Airways",),
    AirLinesModel(name: "Singapore Airlines",),
    AirLinesModel(name: "Air France",),
    AirLinesModel(name: "British Airways",),
    AirLinesModel(name: "Cathay Pacific",),
    AirLinesModel(name: "ANA (All Nippon Airways)",),
    AirLinesModel(name: "Etihad Airways",),
    AirLinesModel(name: "Southwest Airlines",),
    AirLinesModel(name: "Air Canada",),
    AirLinesModel(name: "KLM (Royal Dutch Airlines)",),
    AirLinesModel(name: "Turkish Airlines",),
    AirLinesModel(name: "Virgin Atlantic",),
    AirLinesModel(name: "Qantas",),
    AirLinesModel(name: "Alaska Airlines",),
    AirLinesModel(name: "JetBlue Airways",),
  ];




  void setSelectCIPIndex(int index){
    selectCIPIndex = index;
    update();
  }

  void nextCIPages(){
    if(collectInformationPages.length == (selectCIPIndex+1)){
      Get.offAllNamed(RouteHelper.getWelcomeScreen());
    }
   cIPPageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void skipCIPages(){
    cIPPageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void onBackPress(){
    if(selectCIPIndex == 0){
      Get.back();
    }else{
      cIPPageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
    }
  }

  void selectJourneyLocation({required int index}){
    bool value = locations.elementAt(index).isSelect;
    locations[index] = locations[index].copyWith(isSelect: !value);
    update();
  }

  void selectDineOption({required int index}){
    bool value = dineData.elementAt(index).isSelect;
    dineData[index] = dineData[index].copyWith(isSelect: !value);
    update();
  }

  void selectAirline({required int index}){
    bool value = airlines.elementAt(index).isSelect;
    airlines[index] = airlines[index].copyWith(isSelect: !value);
    update();
  }
}