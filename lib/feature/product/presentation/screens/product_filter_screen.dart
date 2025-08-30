
import 'package:flutter/material.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class ProductFilterScreenView extends StatefulWidget {
  const ProductFilterScreenView({super.key});

  @override
  State<ProductFilterScreenView> createState() => _ProductFilterScreenViewState();
}

class _ProductFilterScreenViewState extends State<ProductFilterScreenView> {
  int selectedIndex = 0;
  int priceIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {selectedIndex = index; });
  }
  void priceSelectedIndex(int index) {
    setState(() {priceIndex = index; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: const Icon(Icons.close),
       title: const Text("Fitter"),centerTitle: true,),
    body: Padding(
      padding: const EdgeInsets.all(Dimensions.defaultSize),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories',style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
            Text("See All",style: textMedium.copyWith(color: Theme.of(context).primaryColor),),
        ],),


        SizedBox(height: Dimensions.fifty,width: double.maxFinite,
          child: Row( children: [

            GestureDetector (
                onTap: (){ setSelectedIndex(0);},
                child: CustomCircular(
                    width: Dimensions.hundred,
                    bottomColor: (selectedIndex== 0)?Colors.green:Colors.white,
                    outlineColor:  (selectedIndex== 0)?Colors.black:Colors.green, radius: Dimensions.fifty,
                    widget:  Center(child: Text('Women',style:  TextStyle(color: (selectedIndex== 0)?Colors.white:Colors.green))))),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: GestureDetector (
                  onTap: (){ setSelectedIndex(1);},
                  child: CustomCircular(
                      bottomColor: (selectedIndex== 1)?Colors.green:Colors.white,
                      outlineColor:  (selectedIndex== 1)?Colors.black:Colors.green, radius: Dimensions.fifty,
                      widget:  Center(child: Text('Man',style:  TextStyle(color: (selectedIndex== 1)?Colors.white:Colors.green))))),
            ),

            GestureDetector (
                onTap: (){ setSelectedIndex(3);},
                child: CustomCircular(
                    bottomColor: (selectedIndex== 2)?Colors.green:Colors.white,
                    outlineColor:  (selectedIndex== 2)?Colors.black:Colors.green, radius: Dimensions.fifty,
                    widget:  Center(child: Text('Shoe',style:  TextStyle(color: (selectedIndex== 2)?Colors.white:Colors.green))))),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: GestureDetector (
                  onTap: (){ setSelectedIndex(3);},
                  child: CustomCircular(
                      bottomColor: (selectedIndex== 3)?Colors.green:Colors.white,
                      outlineColor:  (selectedIndex== 3)?Colors.black:Colors.green, radius: Dimensions.fifty,
                      widget:  Center(child: Text('Bag',style:  TextStyle(color: (selectedIndex== 3)?Colors.white:Colors.green))))),
            ),

          ],),
        ),

        SizedBox(height: Dimensions.fifty,width: double.maxFinite,
          child: Row( children: [

            GestureDetector (
                onTap: (){ setSelectedIndex(4);},
                child: CustomCircular(
                    width: Dimensions.hundred,
                    bottomColor: (selectedIndex== 4)?Colors.green:Colors.white,
                    outlineColor:  (selectedIndex== 4)?Colors.black:Colors.green, radius: Dimensions.fifty,
                    widget:  Center(child: Text('Luxury',style:  TextStyle(color: (selectedIndex== 4)?Colors.white:Colors.green))))),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: GestureDetector (
                  onTap: (){ setSelectedIndex(5);},
                  child: CustomCircular(
                      bottomColor: (selectedIndex== 5)?Colors.green:Colors.white,
                      outlineColor:  (selectedIndex== 5)?Colors.black:Colors.green, radius: Dimensions.fifty,
                      widget:  Center(child: Text('Kids',style:  TextStyle(color: (selectedIndex== 5)?Colors.white:Colors.green))))),
            ),

            GestureDetector (
                onTap: (){ setSelectedIndex(6);},
                child: CustomCircular(
                    bottomColor: (selectedIndex== 6)?Colors.green:Colors.white,
                    outlineColor:  (selectedIndex== 6)?Colors.black:Colors.green, radius: Dimensions.fifty,
                    widget:  Center(child: Text('Sports',style:  TextStyle(color: (selectedIndex== 6)?Colors.white:Colors.green))))),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: GestureDetector (
                  onTap: (){ setSelectedIndex(7);},
                  child: CustomCircular(
                      bottomColor: (selectedIndex== 7)?Colors.green:Colors.white,
                      outlineColor:  (selectedIndex== 7)?Colors.black:Colors.green, radius: Dimensions.fifty,
                      widget:  Center(child: Text('Beauty',style:  TextStyle(color: (selectedIndex== 7)?Colors.white:Colors.green))))),
            ),

          ],),
        ),

        SizedBox(height: Dimensions.fifty,width: double.maxFinite,
          child: Row( children: [

            GestureDetector (
                onTap: (){ setSelectedIndex(9);},
                child: CustomCircular(
                    width: Dimensions.hundred,
                    bottomColor: (selectedIndex== 9)?Colors.green:Colors.white,
                    outlineColor:  (selectedIndex== 9)?Colors.black:Colors.green, radius: Dimensions.fifty,
                    widget:  Center(child: Text('LifeStyle',style:  TextStyle(color: (selectedIndex== 0)?Colors.white:Colors.green))))),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: GestureDetector (
                  onTap: (){ setSelectedIndex(10);},
                  child: CustomCircular(
                      bottomColor: (selectedIndex== 10)?Colors.green:Colors.white,
                      outlineColor:  (selectedIndex== 10)?Colors.black:Colors.green, radius: Dimensions.fifty,
                      widget:  Center(child: Text('Other',style:  TextStyle(color: (selectedIndex== 1)?Colors.white:Colors.green))))),
            ),



          ],),
        ),

      const SizedBox(height: 1
        ,),
        Text("Price",style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
        SizedBox(height: Dimensions.hundred,
          child: Wrap( direction: Axis.vertical,
            alignment: WrapAlignment.spaceBetween,

            runSpacing: 8,

            children: [

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$40",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$50",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$60",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$70",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$80",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$90",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

              CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.eight),
                child: Text("\$1-\$100",style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
              ),),

          ],),
        ),


        Text("Rating",style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),

        Row(children: [
          CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
            child: Row(children: [
              Icon(Icons.star,color: Colors.red,),
              Text(" 3 & up",style: textBold,)
            ],),
          ),),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
            child: CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
              child: Row(children: [
                Icon(Icons.star,color: Colors.red,),
                Text(" 4 & up",style: textBold,)
              ],),
            ),),
          ),

          CustomOutlineCircular(height: Dimensions.fortyFive,widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultSize),
            child: Row(children: [
              Icon(Icons.star,color: Colors.red,),
              Text(" 5",style: textBold,)
            ],),
          ),),
        ],),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Size",style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
            Row(
              children: [
                Text('See All',style: textMedium.copyWith(color: Theme.of(context).primaryColor),),
                Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,),
              ],
            )
          ],
        ),




      const Spacer(),

  Container(height: Dimensions.hundred,color: Theme.of(context).cardColor,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    CustomSmallBottom(widget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.fifty),
      child: Text("Reset",style: textMedium.copyWith(color: Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeLarge),),
    ),
        color: Theme.of(context).hoverColor),
    CustomSmallBottom(widget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.fifty),
      child: Text("Apply",style: textMedium.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSizeLarge),),
    ), color: Theme.of(context).primaryColor),
  ],
),
)

      ],),
    ),

    );
  }
}
