
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/feature/accounts/view/account_screen.dart';
import 'package:test_project/feature/cart/presentation/screens/cart_screen.dart';
import 'package:test_project/feature/dashboard/views/Cart_screen_view.dart';
import 'package:test_project/feature/dashboard/views/order_screen.dart';
import 'package:test_project/feature/dashboard/views/wish_list_view.dart';
import 'package:test_project/feature/home/presentation/home_screen.dart';
import 'package:test_project/feature/home/presentation/home_screen_view.dart';
import 'package:test_project/feature/profile/presentation/screens/profile_screen_screen.dart';

class DashboardController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;
  late List<Widget> screen;
  Widget? _currentScreen;
  Widget? get currentScreen => _currentScreen;
  DashboardController() {
    initPage();
  }


  selectHomePage({bool first = true}) {
    _currentScreen = screen[0];
    _currentTab = 0;
    if(first){
      update();
    }

  }

  void initPage() {
    screen = [
     const HomeScreen(),
      //const HomeScreenView(),
      const WishListScreenView(),

      const CartScreenView(),
     const OrderScreenView(),
      const AccountScreenView(),

    ];
    _currentScreen = screen[0];
  }

  selectOrderHistoryScreen({bool fromHome =  false}) {
    _currentScreen = screen[1];
    _currentTab = 1;
    update();

  }

  selectConversationScreen() {
    _currentScreen = screen[2];
    _currentTab = 2;
    update();
  }

  selectNotificationScreen() {
    _currentScreen = screen[3];
    _currentTab = 3;
    update();
  }
  selectProfileScreen() {
    _currentScreen = screen[4];
    _currentTab = 4;
    update();
  }
}
