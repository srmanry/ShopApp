import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard ({super.key});

  @override
  Widget build(BuildContext context) {

     return Padding(padding: const EdgeInsets.all(5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(color: Theme.of(context).hoverColor,
            height: 220,

            child:  const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Icon(Icons.star,color: Colors.amber,), Text("4.7",style: textBold,),


                    ],),
                    CircleAvatar(child: Icon(Icons.favorite_border,color: Colors.white,),)
                  ],
                ),
                SizedBox(height: Dimensions.twenty,),

                Image(image: AssetImage("assets/image/FG3.png"),fit: BoxFit.cover,height: 100,width: 100,)
              ],),
            ),

          ),
          const SizedBox(height: 5,),
          const Text("Product Title",style: textBold,),
          Text("\$45.5",style: textMedium.copyWith(color: Theme.of(context).primaryColor),)

        ],
      ),
    );

  }
}
