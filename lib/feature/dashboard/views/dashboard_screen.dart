
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/animated_custom_dialog.dart';
import 'package:test_project/common/widget/confirmation_dialog_widget.dart';
import 'package:test_project/feature/dashboard/controller/dashboard_controller.dart';
import 'package:test_project/feature/dashboard/widget/custom_botom_navy_bar_widget.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    Get.find<DashboardController>().selectHomePage(first: false);

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) async {
        _onWillPop(context);
        return;
      },
      child: GetBuilder<DashboardController>(builder: (menuController) {
        return Scaffold(
          resizeToAvoidBottomInset: false,

          body: PageStorage(bucket: bucket, child: menuController.currentScreen!),

          bottomNavigationBar: BottomNavBarWidget(
            backgroundColor: Theme.of(context).cardColor,
            selectedIndex: menuController.currentTab,
            showElevation: true,
            animationDuration: const Duration(milliseconds: 500),
            itemCornerRadius: 24,
            curve: Curves.ease,
            items: [
              _barItem(Images.home, 'Home'.tr, 0, menuController),
              _barItem(Images.category, 'Wishlist'.tr, 1, menuController),
              _barItem(Images.sales, 'Cart'.tr, 2, menuController),
              _barItem(Images.cart, 'My order'.tr, 3, menuController),
              _barItem(Images.profile, 'Account'.tr, 4, menuController),
            ],
            onItemSelected: (int index) {
              if(index == 0){
                menuController.selectHomePage();
              }else if(index == 1){
                menuController.selectOrderHistoryScreen();
              }else if(index == 2){
                menuController.selectConversationScreen();
              }else if(index == 3){
                menuController.selectNotificationScreen();
              }else if(index == 4){
                menuController.selectProfileScreen();
              }
            },
          ),
        );
      }),
    );
  }

  BottomNavyBarItem _barItem(String icon, String label, int index, DashboardController menuController) {
    return BottomNavyBarItem(
        activeColor: Theme.of(context).primaryColor,
        textAlign: TextAlign.center,
        icon: index == menuController.currentTab ? const SizedBox() :
        SizedBox(width: Dimensions.iconSizeMedium,
            child: Padding(padding: const EdgeInsets.only(left: 5),
              child: Image.asset(icon, color : index == menuController.currentTab ?
              Theme.of(context).cardColor : Theme.of(context).hintColor))),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(width: Dimensions.iconSizeMedium, child: Image.asset(icon, color : index == menuController.currentTab ?
          Colors.white : Theme.of(context).hintColor)),

          const SizedBox(width: 4),
          Text(label, style: textRegular.copyWith(color: index == menuController.currentTab ?
          Colors.white : Theme.of(context).hintColor))]));
  }


}
Future<bool> _onWillPop(BuildContext context) async {
  showAnimatedDialog(context,  ConfirmationDialogWidget(icon: Images.logo,
    title: 'exit_app'.tr,
    description: 'do_you_want_to_exit_the_app'.tr, onYesPressed: (){
      SystemNavigator.pop();
    },),isFlip: true);
  return true;
}


