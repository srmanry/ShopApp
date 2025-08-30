import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project/common/widget/custom_tabar.dart';
import 'package:test_project/common/widget/text_fild.dart';

import 'package:test_project/feature/notification/views/notification_view.dart';
import 'package:test_project/feature/product/domain/models/product_data.dart';
import 'package:test_project/feature/product/domain/models/shoe_models.dart';
import 'package:test_project/feature/product/presentation/screens/product_filter_screen.dart';
import 'package:test_project/feature/product/presentation/screens/product_view.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Product> productWishList=[];

  List<Product> cart = [];

  void addToCart(Product product) {setState(() { cart.add(product);});}

  CarouselSliderController carouselController = CarouselSliderController();
  setSelectedIndex(int index){
    setState(() {selectedIndex = index;});}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Padding(padding: EdgeInsets.all(8.0),
        child: Image(image:AssetImage(Images.logo)),),
        centerTitle: true,title: const Text("Fashion"),
      actions: [InkWell(
          onTap: (){Get.to(const NotificationScreenView());},
          child: const Icon(Icons.notifications_none_outlined))], ),

      body: Padding(
        padding:   const EdgeInsets.all(Dimensions.defaultSize),
        child: ListView(

        children: [
          const CustomTextfield(hinText: "Search Trends",priFixIcon: Icon(Icons.search),),

          CarouselSlider(
          carouselController: carouselController,
          items: const [
            Image(image: AssetImage("assets/image/FG1.png"),fit: BoxFit.cover,),
            Image(image: AssetImage("assets/image/FG2.png"),fit: BoxFit.cover,),
            Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,),
          ],
              options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true, aspectRatio: 2, viewportFraction: 1,)),

          Padding(padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeLarge),
            child: SizedBox( height: 35,
              child: ListView.builder(itemCount: activityTabName.length,
                  scrollDirection: Axis.horizontal,itemBuilder: (_,index){
                    return FundRisingTypeItem(
                      index: index,selectedIndex: selectedIndex,
                        tabNameWidget:Text(activityTabName[index],style:TextStyle(color:  index ==selectedIndex?Theme.of(context).cardColor:Theme.of(context).colorScheme.onTertiaryContainer)) ,
                        onTap: (){setState(() {selectedIndex = index;});}
                     );}),),),

          selectedIndex==0?
          Expanded(child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7,),
              itemCount: 12,
              itemBuilder: (context,index){
              return Padding(  padding: const EdgeInsets.all(5.0),
                child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(color: Theme.of(context).hoverColor,
                     height: Dimensions.twoHundredTow,
                      child:  const Padding(padding: EdgeInsets.all(10.0),
                       child: Column(children: [

                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                              Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),
                            ],),
                            CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                          ],),

                        SizedBox(height: Dimensions.twenty,),
                        Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,height: 100,width: 100,)
                      ],), ),  ),

                    const SizedBox(height: 5,),
                    const Text("All... Title",style: textBold,),
                    Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)
                 ], ),  ); },  ),) :selectedIndex==1?

          Expanded(child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,),
              itemCount: 12, itemBuilder: (context,index){
                return Padding(padding: const EdgeInsets.all(5.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(color: Theme.of(context).hoverColor,
                        height: Dimensions.twoHundredTow,

                        child:  Padding(padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                  Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,), ],),
                                InkWell(
                                    onTap: (){},
                                    child: const CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),))
                              ]),
                            const SizedBox(height: Dimensions.twenty,),
                            const Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,height: 100,width: 100,)
                          ],), ), ),

                      const SizedBox(height: 5,),
                      InkWell(onTap: (){ Get.to(const ProductViewScreen()); },
                        child: Text("Women",style: textBold,),),
                        Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

                    ],  ), );   },),) :selectedIndex==2?

          Expanded(child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7,),
              itemCount: manProductList.length, itemBuilder: (context,index){
                return Padding(padding: const EdgeInsets.all(5.0),

                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(color: Theme.of(context).hoverColor, height: Dimensions.twoHundredTow,
                        child:  Padding(padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [ Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),],),
                                CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                              ], ),

                          //  SizedBox(height: Dimensions.twenty,),

                            Image(image: AssetImage("${manProductList[index]}"),fit: BoxFit.cover,width: double.maxFinite,)
                          ],), ),

                      ),
                      const SizedBox(height: 5,),
                      const Text(" Man Product ",style: textBold,),
                      Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

                    ],),
                ); }, ),):selectedIndex==3?
          Expanded(child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7,),
            itemCount: shoeImageList.length, itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.all(5.0),

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Theme.of(context).hoverColor, height: Dimensions.twoHundredTow,
                    child:  Padding(padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),],),
                            CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                          ], ),

                        SizedBox(height: Dimensions.twenty,),

                        Image(image: AssetImage("${shoeImageList[index]}"),fit: BoxFit.cover,height: 100,width: double.maxFinite,)
                      ],), ),

                  ),
                  const SizedBox(height: 5,),
                  const Text(" Shoe Product Title '''' last",style: textBold,),
                  Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

                ],),
            ); }, ),):selectedIndex==4?
          Expanded(child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7,),
            itemCount: 12, itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.all(5.0),

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Theme.of(context).hoverColor, height: Dimensions.twoHundredTow,
                    child:  const Padding(padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),],),
                            CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                          ], ),

                        SizedBox(height: Dimensions.twenty,),

                        Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,height: 100,width: 100,)
                      ],), ),

                  ),
                  const SizedBox(height: 5,),
                  const Text(" Bag Product Title '''' last",style: textBold,),
                  Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

                ],),
            ); }, ),):
          Expanded(child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7,),
            itemCount: 12, itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.all(5.0),

              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(color: Theme.of(context).hoverColor, height: Dimensions.twoHundredTow,
                    child:  const Padding(padding: EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [ Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),],),
                            CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                          ], ),

                        SizedBox(height: Dimensions.twenty,),

                        Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,height: 100,width: 100,)
                      ],), ),

                  ),
                  const SizedBox(height: 5,),
                  const Text("other",style: textBold,),
                  Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

                ],),
            ); }, ),),

        ],),),

      floatingActionButton:Padding(padding: const EdgeInsets.symmetric(vertical: Dimensions.twenty),
        child: Container(
          height: Dimensions.fifty,width: Dimensions.hundredEighty,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(Dimensions.fifty),color: Theme.of(context).cardColor,),
          child:  Padding(padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
             const Row(children: [ Icon(Icons.swap_vert),Text("Sort"),],),
             InkWell(onTap: (){Get.to(const ProductFilterScreenView());},child: Row(children: [ Icon(Icons.tune),Text("Filter"),],))
            ],),  ),
        ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
List activityTabName= ["All", "Women", "Man", "Shoe","Bog","kids","Sport"];