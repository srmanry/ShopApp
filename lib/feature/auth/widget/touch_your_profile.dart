import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:get/get.dart';

class TouchYourProfileWidget extends StatelessWidget {
  const TouchYourProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical:Dimensions.paddingSize),
      children: [
        CircleAvatar(
          radius: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(Images.placeholder,width: 120,height: 120,fit: BoxFit.cover,)),
              Positioned(
                bottom: 5,right: 5,
                child: Container(height: 25,width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color:Theme.of(context).primaryColor ),
                  child: Icon(Icons.edit,color: Theme.of(context).cardColor,size: 18),
                ),
              )
            ],
          ),
        ),

        CustomTextField(
          title: "fullName".tr,hintText: "fullName".tr,
          filled: true, showBorder: false,
          fillColor: Theme.of(context).hintColor.withOpacity(0.1),
        ),

        const SizedBox(height: Dimensions.paddingSize,),
        CustomTextField(
          title: "phoneNumber".tr,hintText: "phoneNumber".tr,
          filled: true, showBorder: false,
          inputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10),],
          fillColor: Theme.of(context).hintColor.withOpacity(0.1),
        ),

        const SizedBox(height: Dimensions.paddingSize,),
        CustomTextField(
          title: "dateOfBirth".tr,hintText: "dateOfBirth".tr,
          filled: true, showBorder: false,
          readOnly:  true,
          onTap: () => showDatePicker(context: context, firstDate: DateTime(1952), lastDate: DateTime.now()),
          suffix: Icon(Icons.calendar_month_outlined,color: Theme.of(context).hintColor),
          fillColor: Theme.of(context).hintColor.withOpacity(0.1),
        ),

      ]);
  }
}
