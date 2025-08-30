
import 'package:flutter/material.dart';

import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/common/widget/custom_row.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class AccountScreenView extends StatelessWidget {
  const AccountScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Padding(padding: const EdgeInsets.all(8.0),
          child: Image(image: const AssetImage(Images.logo,),color: Theme.of(context).primaryColor,),),
          centerTitle: true,  title: const Text("Account "),
          actions: const [ Padding(padding: EdgeInsets.all(8.0),child: Icon(Icons.qr_code_2_sharp),)], ),

      body: Padding(padding: const EdgeInsets.all(Dimensions.fifTeen),
        child: SingleChildScrollView(child: Column(children: [

          Container( height: 100,
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.five), ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultSize),
                child: CustomCircular( outlineColor: Theme.of(context).cardColor,radius: Dimensions.defaultSize,
                widget:  SizedBox(height: 60,
                  child: Row(children: [Padding(padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(borderRadius: BorderRadius.circular(50),
                       child: const Image(image: AssetImage("assets/image/user.jpg"),fit: BoxFit.cover,height: 60,width: 60,)),
                    ),

                    const SizedBox(width: Dimensions.twenty,),
                    Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ const Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Andrew Ainsley",style: textBold),
                          SizedBox(height: Dimensions.defaultSize,),
                          Text('+00.56663211502',style: textRegular,),], ),
                        InkWell(onTap:(){},child: const Icon(Icons.qr_code)), ],),),]),
                ),
                            ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimensions.five), ),

              child: Padding( padding: const EdgeInsets.all(Dimensions.defaultSize),
                child: Column(
                children: [
                  GestureDetector(onTap: (){},child: const CustomRowWidget(title: "Manage Address", leadingIcon: Icon(Icons.location_on_outlined),)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                    child: GestureDetector(onTap: (){},child: const CustomRowWidget(title: "Payment Methods", leadingIcon: Icon(Icons.money),)),
                  ),
                  GestureDetector(onTap: (){},child: const CustomRowWidget(title: "Account & Security", leadingIcon: Icon(Icons.privacy_tip_outlined),)),

                ],
                            ),
              ),),
          ),


          Container( decoration: BoxDecoration(color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Dimensions.five), ),
            child: Column(children: [
            //const SizedBox(height: Dimensions.twenty,),
            Padding( padding: const EdgeInsets.all(Dimensions.defaultSize),
              child: Column(children: [
                 Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                  child: GestureDetector(onTap: (){},
                      child: const CustomRowWidget(title: "My account", leadingIcon: Icon(Icons.person_outline))),),

                 GestureDetector(onTap: (){},child: const CustomRowWidget(title: "Notification", leadingIcon: Icon(Icons.notifications_none),)),
                 Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                  child: GestureDetector(onTap: (){},
                      child: const CustomRowWidget(title: "Account & Setting", leadingIcon: Icon(Icons.privacy_tip_outlined),)), ),

                 GestureDetector(onTap: (){}, child: const CustomRowWidget(title: "Linked Accounts", leadingIcon: Icon(Icons.link_rounded))),
                 Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                  child: GestureDetector(onTap:(){},child: const CustomRowWidget(title: "App Appearance", leadingIcon: Icon(Icons.visibility))),),

                GestureDetector(onTap:(){},child: const CustomRowWidget(title: "Data & Analytics", leadingIcon: Icon(Icons.data_thresholding))),
                 Padding( padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                 child: GestureDetector(onTap: (){},child: const CustomRowWidget(title: "Help & Support", leadingIcon: Icon(Icons.help))),),

                const CustomRowWidget(title: "Rate us", leadingIcon: Icon(Icons.star_border)),
                Padding(padding:  const EdgeInsets.symmetric(vertical: Dimensions.twenty),
                  child:InkWell(
                    child: Row(children: [
                      Icon(Icons.logout_outlined,color: Theme.of(context).colorScheme.error,),
                       const SizedBox(width: Dimensions.fifTeen,),const Text("Logout")
                    ],),onTap: (){
                      showModalBottomSheet(context: context, builder:(BuildContext context){
                        return Container(width: double.maxFinite,height: Dimensions.twoHundred,
                          decoration: const BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.defaultSize),
                              topRight: Radius.circular(Dimensions.defaultSize),),),

                          child:Column(
                            children: [
                              Text("Logout",style: textBold.copyWith(color: Colors.red,fontSize: Dimensions.fontSizeLarge),),
                              const Text("Sure you want to log out?",style: textMedium,),
                              CustomSmallBottom(widget:  Text("Cancel",style: textMedium.copyWith(color: Theme.of(context).primaryColor),), color: Theme.of(context).primaryColor.withOpacity(5.0)),
                            ],) ,);});
                  },),),

              ],),)
              
            ],),),])))

    );
  }
}
