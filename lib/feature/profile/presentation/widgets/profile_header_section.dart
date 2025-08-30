import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Padding(padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Text("Profile", style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge))])),

      Padding(padding: const EdgeInsets.all(8.0),
        child: Row(children: [
           Stack(clipBehavior: Clip.none, children: [
              const CustomImage(image: "", width: Dimensions.profileImageSize, height: Dimensions.profileImageSize,forCircleImage: true,),

            Positioned(bottom: -5, right: -5, child: CircleAvatar(backgroundColor: Theme.of(context).primaryColor,
              radius: 10,child: const Icon(Icons.edit, size: 13,),))]),

          const SizedBox(width: Dimensions.paddingSizeSmall,),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Software Company", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
            Text("+1 631 805 8324", style: textRegular.copyWith(),),
            Text("company@gmail.com", style: textRegular.copyWith(),),
          ]))
        ],),
      )
    ],);
  }
}
