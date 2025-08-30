import 'package:flutter/material.dart';
import 'package:test_project/feature/auth/controller/auth_controller.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';
import 'package:get/get.dart';

class FlyYourWayWidget extends StatelessWidget {
  const FlyYourWayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSize),
        itemCount: authController.airlines.length,
        itemBuilder: (context, index) {
          var data =  authController.airlines.elementAt(index);
          String name = data.name;
          bool isSelect = data.isSelect;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelect
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor.withOpacity(0.1),
                    width: isSelect ? 2 : 1.2
                ),
                borderRadius: BorderRadius.circular(8),

              ),
              child:  Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => authController.selectAirline(index: index),
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,vertical: Dimensions.paddingSize),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(Images.placeholder,width: 50,height: 50,fit: BoxFit.cover,)),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSix),
                          child: Text(name, style: textMedium.copyWith(color: Theme.of(context).colorScheme.secondary),),
                        ),
                      ),

                      Visibility(
                          visible: isSelect,
                          child: Icon(Icons.done,color: Theme.of(context).primaryColor,))
                    ]),
                  ),

                ),
              ),
            ),
          );
        },
      );
    });
  }
}
