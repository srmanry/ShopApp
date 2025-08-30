import 'package:flutter/material.dart';
import 'package:test_project/feature/auth/controller/auth_controller.dart';
import 'package:test_project/feature/auth/widget/custom_chip.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';
import 'package:get/get.dart';

class DineYourWayWidget extends StatelessWidget {
  const DineYourWayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSize),
          children: [
            Wrap(
              children:
              List.generate(authController.dineData.length, (index) {
                var data =  authController.dineData.elementAt(index);
                String name = data.name;
                bool isSelect = data.isSelect;
                return CustomChip(name: name, isSelect: isSelect, onSelected:() => authController.selectDineOption(index: index));

              }),
            )
          ],
        );
      }
    );
  }
}
