import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';

class CartScreenView extends StatelessWidget {
  const CartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(centerTitle: true,title: const Text("Cart ScreenView"),),

      body: Padding(
        padding: const EdgeInsets.all(Dimensions.defaultSize),
        child: ListView.builder(itemCount: 10,itemBuilder: (_,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.defaultSize),
            child: Container(height: Dimensions.twoHundred,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.defaultSize),
              color: Theme.of(context).cardColor,
            ),)
          );
        }),
      ),
    );
  }
}


List producAddtList = [];