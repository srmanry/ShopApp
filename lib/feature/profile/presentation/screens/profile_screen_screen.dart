import 'package:flutter/material.dart';
import 'package:test_project/feature/profile/presentation/widgets/profile_header_section.dart';
import 'package:test_project/feature/profile/presentation/widgets/profile_item_widget.dart';
import 'package:test_project/feature/profile/widget/select_language_bottom_sheet.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: true,
      child: Scaffold(body: Column(children: [
        const ProfileHeaderSection(),
        const SizedBox(height: Dimensions.paddingSizeExtraLarge),


        const TitleButton(icon: Images.logo, title: 'my_profile', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'my_order', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'change_theme', navigateTo: SizedBox(),),

        TitleButton(icon: Images.logo, title: 'change_language', navigateTo: const SizedBox(),
        onTap: ()=> showModalBottomSheet(backgroundColor: Colors.transparent,
            isScrollControlled: true, context: context, builder: (_)=> const SelectLanguageBottomSheet())),

        const TitleButton(icon: Images.logo, title: 'privacy_policy', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'terms_and_conditions', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'refund_policy', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'return_policy', navigateTo: SizedBox(),),
        const TitleButton(icon: Images.logo, title: 'login', navigateTo: SizedBox(),),
      ],),),
    );
  }
}
