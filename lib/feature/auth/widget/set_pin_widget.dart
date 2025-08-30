import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class SetPINWidget extends StatelessWidget {
  const SetPINWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(height: Get.height*0.2,),

      Pinput(
        length: 4,
        keyboardType: TextInputType.phone,
        obscureText: true,
        obscuringWidget: Icon(Icons.circle,color: Theme.of(context).colorScheme.secondary,size: 20),
        defaultPinTheme: PinTheme(
          height: Get.width/5, width: Get.width/5,
          textStyle: textBold.copyWith(color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeOverLarge),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: Get.width/4.9, width: Get.width/4.9,
          textStyle: textBold.copyWith(color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeOverLarge),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).primaryColor),
            boxShadow: [BoxShadow(color:  Theme.of(context).primaryColor.withOpacity(0.16), spreadRadius: 3,)],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),

    ],);
  }
}
