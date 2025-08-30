import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/feature/auth/controller/auth_controller.dart';
import 'package:test_project/util/dimensions.dart';

class CollectUserInformationNavBar extends StatelessWidget {
  const CollectUserInformationNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSize),
          child: Row(
            children: [
              if(authController.selectCIPIndex == 1 || authController.selectCIPIndex == 2 || authController.selectCIPIndex == 3 )
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomButton(onTap: () => authController.skipCIPages(),
                      buttonColor: Theme.of(context).primaryColor.withOpacity(0.1),
                      textColor: Theme.of(context).primaryColor,
                      text: "skip".tr,height: 45),
                ),
              ),
              Expanded(
                child: CustomButton(onTap: () => authController.nextCIPages(),
                    text: authController.selectCIPIndex == 4?  "agreeContinue".tr : "continue".tr,height: 45),
              ),
            ],
          ),
        );
      }
    );
  }
}
