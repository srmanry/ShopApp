import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  int currentPage =0;

  List<String> productImageList = [
    "assets/image/FG1.png",
    "assets/image/FG2.png",
    "assets/image/FG3.png",
  ];
  int selectedIndex = 0 ;
  setSelectedIndex(int index){
    setState(() {selectedIndex = index;});}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Product "),centerTitle: true,
        actions: [
          InkWell(onTap: ()async{ await Share.share('check out my website https://example.com');},
              child: const Icon(Icons.share_outlined,)),
          const Padding( padding: EdgeInsets.all(8.0), child: Icon(Icons.more_vert), ),
        ],
      ),

      body: Padding(padding: const EdgeInsets.all(Dimensions.defaultSize),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(flex: 3,child: PageView.builder(
              itemCount: productImageList.length,
              itemBuilder: (context,index){return
            Image(image: AssetImage("${productImageList[index]}",),fit: BoxFit.fitHeight,);

          })),

            Center(
              child: CustomCircular(
                widget: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [  selectedIndex==1?Text("1"):selectedIndex==1?Text("2"):Text("3"),
                    Text("/"), Text("${productImageList.length}"),
                  ],
                ),
                outlineColor: Theme.of(context).colorScheme.onSecondary,
                radius: Dimensions.defaultSize,
                height: 45,width: 50,
              ),
            ),
            //

            const Spacer(),
            Text('Urban Blend Long Sleeve Shirt ',style: textBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
            Padding( padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultSize),
            child: Row(children: [
                const Text("\$1856.00,"),
                Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.twenty),
                  child: Container(height: 40,color: Theme.of(context).hoverColor,
                  child: const Padding( padding: EdgeInsets.all(8.0), child: Text('2.43453'),),
                  ),
                ),
                const Icon(Icons.star,color: Colors.amber,),
                const Text("24.5"),

              ],
            ),
          ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircular(outlineColor: Colors.white, radius: Dimensions.defaultSize, color: Theme.of(context).colorScheme.tertiary,height: 45,width: 45,
                widget: Icon(Icons.favorite_border_outlined,color: Theme.of(context).primaryColor,),
                ),
                CustomSmallBottom(widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.twenty),
                  child: Text("Buy Now",style: textMedium.copyWith(color: Theme.of(context).primaryColor),),
                ), color: Theme.of(context).colorScheme.tertiary,),
                CustomSmallBottom(widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.twenty),
                  child: Text("Add to Cart",style: textMedium.copyWith(color: Theme.of(context).cardColor),),
                ), color: Theme.of(context).primaryColor),
              ],
            ),
            const SizedBox(height: Dimensions.defaultSize,)
          ],
        ),
      ),
    );
  }
}
