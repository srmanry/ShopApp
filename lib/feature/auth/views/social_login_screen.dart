import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/feature/auth/views/join_app.dart';
import 'package:test_project/feature/auth/views/sign_up_screen.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class SocialLoginScreenView extends StatelessWidget {
  const SocialLoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Center(
          child: Padding(padding: const EdgeInsets.all(Dimensions.defaultSize),
              child: Column(children: [
                const SizedBox(height: Dimensions.eighty,),

                Image(image: const AssetImage(Images.logo,),color: Theme.of(context).primaryColor,height: Dimensions.eighty,),
                const SizedBox(height: Dimensions.fifty),
                Text("let'sGetStarted".tr,style: textBold.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                const SizedBox(height: Dimensions.twenty,),
                Text("let'sDiveIntoYourAccount".tr,style: textRegular.copyWith(fontSize:Dimensions.fontSizeExtraLarge ),),
                const SizedBox(height: Dimensions.sixty),

                const CustomOutLineBottom(bottomText: "Continue with the Google", bottomImage:Images.google,),
                const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.twenty),
                 child: CustomOutLineBottom(bottomText: "Continue with the Twitter", bottomImage: Images.x,),),

                const CustomOutLineBottom(bottomText: "Continue with Facebook",bottomImage: Images.facebook,),
                const SizedBox(height: Dimensions.twenty,),

                const CustomOutLineBottom(bottomText: "      Continue with X      ",bottomImage: Images.apple,),
                const SizedBox(height: Dimensions.twenty,),

                InkWell(onTap: (){
                  //Get.toNamed(RouteHelper.joinRide);
                  Get.to(JoinFashionAppToday());
                  },
                 child: CustomBottom(bottomColor:Theme.of(context).primaryColor ,name: "Sign up",textColor: Theme.of(context).cardColor)),

               const SizedBox(height:Dimensions.fifTeen),
                InkWell(onTap: (){

                 // Get.toNamed(RouteHelper.login);
                  },
                 child:  Container(height:Dimensions.fifty,width: double.infinity,
                   decoration: BoxDecoration(
                       color:  Theme.of(context).hoverColor,
                       borderRadius: BorderRadius.circular(Dimensions.fifty),
                       border: Border.all(width: 1.5,color: Theme.of(context).hoverColor)
                   ),

                   child: Center(child: Text("Sign in",style:textMedium.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).primaryColor)),),
                 ),

                ),

                const SizedBox(height:Dimensions.thirty),
                const Text("Privacy Policy .. Terms of  service"),

]
            ),),
        ),);
  }
}
