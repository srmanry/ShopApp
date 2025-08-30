import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_tab.dart';
import 'package:test_project/common/widget/custom_tabar.dart';
import 'package:test_project/feature/notification/views/general_notification.dart';
import 'package:test_project/feature/notification/views/promotions_notification_screen.dart';

class  NotificationScreenView extends StatefulWidget {
  const  NotificationScreenView({super.key});

  @override
  State<NotificationScreenView> createState() => _NotificationScreenViewState();
}

class _NotificationScreenViewState extends State<NotificationScreenView> {
  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {selectedIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child:   Scaffold(
          appBar: AppBar(
            title: const Text("Notification"),centerTitle: true,
            actions: const [
              Padding(padding: EdgeInsets.all(8.0),
                child: Icon(Icons.settings_outlined),  )  ],),

          body:  Column(
            children: [
              TabWidget(
                tabName1: "General",
                tabName2: "Promotions"),
              const Expanded(child: TabBarView(children: [
                GeneralNotificationScreen(),
                PromotionsNotificationScreen()
              ])),
            ],

    )
    ));
  }
}
