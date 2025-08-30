import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_auth_scereen_app_bar.dart';
import 'package:test_project/feature/auth/controller/auth_controller.dart';
import 'package:test_project/feature/auth/widget/collect_user_information_nav_bar.dart';

class CollectUserInformationScreen extends StatelessWidget {
  const CollectUserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AuthController>(
      builder: (authController) {
        return Scaffold(
          appBar: CustomAuthScreenAppBar(
            onBackPress: () => authController.onBackPress(),
            topTitleWidget: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                height: 12,
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 12,
                  width: (MediaQuery.of(context).size.width * 0.5) * ((authController.selectCIPIndex + 1 ) / authController.collectInformationPages.length),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            title: authController.collectInformationPages.elementAt(authController.selectCIPIndex).title,
            subTitle: authController.collectInformationPages.elementAt(authController.selectCIPIndex).subTitle,
          ),

          body: PageView.builder(
            controller: authController.cIPPageController,
            onPageChanged: (value) => authController.setSelectCIPIndex(value),
            itemCount: authController.collectInformationPages.length,
            itemBuilder: (context, index) {
            return authController.collectInformationPages.elementAt(index).child;
          },),

          bottomNavigationBar: const CollectUserInformationNavBar()
        );
      }
    );
  }
}
