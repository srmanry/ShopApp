import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/common/widget/custom_text_field.dart';
import 'package:test_project/common/widget/text_fild.dart';
import 'package:test_project/feature/auth/views/sign_in_screen.dart';
import 'package:test_project/feature/auth/views/sign_up_screen.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

import 'welcome_screen.dart';

class JoinFashionAppToday extends StatefulWidget {
  const JoinFashionAppToday({super.key});

  @override
  State<JoinFashionAppToday> createState() => _JoinFashionAppTodayState();
}

class _JoinFashionAppTodayState extends State<JoinFashionAppToday> {
  bool? checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      backgroundColor: Theme.of(context).cardColor,
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.fifTeen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Padding(
            padding:  const EdgeInsets.symmetric(vertical:Dimensions.fifTeen),
            child: Text('Join Trendify Today',style: TextStyle(fontSize: Dimensions.fontSizeExtraLarge,fontWeight: FontWeight.bold)), ),


          const Text("Embark on fashion journey tailored for you"),
          const SizedBox(height: Dimensions.twenty,),
          const Padding(padding: EdgeInsets.all(8.0),
            child: Text("Email",style: textMedium,), ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultSize),
             child: const CustomTextfield(hinText: "Email",priFixIcon: Icon(Icons.email_outlined),
             ),
           ),
SizedBox(height: Dimensions.defaultSize,),
      Text("Password",style: textMedium,),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultSize),
      child: const CustomTextfield(hinText: "Password",priFixIcon: Icon(Icons.lock_outline),suffixIcon: Icon(Icons.visibility_off_outlined),
      ),
    ),



          Row(
            children: [
              Checkbox(
                  value: checked,activeColor: Colors.green, focusColor: Theme.of(context).disabledColor,
                  tristate: true, checkColor: Theme.of(context).cardColor,
                  onChanged: (newBool) {setState(() {checked = newBool;});}
              ),
              const Text("  I agree to Trendify ",style: textRegular,),
               InkWell( child: Text("Terms & Conditions",style: textRegular.copyWith(color: Theme.of(context).primaryColor),))
            ],
          ),

           Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.twentyFive),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",style: textRegular,),
                Text("Sign in",style: textRegular.copyWith(color: Theme.of(context).primaryColor),)
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
            child: const Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("or",style: textBold,),
              ],
            ),
          ),

          const CustomOutLineBottom(bottomText: "Continue with the Google", bottomImage:Images.google,),
          const Padding(padding: EdgeInsets.symmetric(vertical: Dimensions.twenty),
            child: CustomOutLineBottom(bottomText: "Continue with the Twitter", bottomImage: Images.x,),),

          Spacer(),
            InkWell(onTap: (){
              Get.to(SignInScreen());
            //Get.toNamed(RouteHelper.joinRide);
            },
            child: CustomBottom(bottomColor:Theme.of(context).primaryColor ,name: "Sign up",textColor: Theme.of(context).cardColor)),

            const SizedBox(height:Dimensions.fifTeen),

SizedBox(height: Dimensions.defaultSize,)

        ],),
      ),



    );
  }
}
