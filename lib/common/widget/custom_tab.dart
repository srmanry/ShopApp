import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';


class TabWidget extends StatelessWidget {
  final String tabName1;
  final String tabName2;
  const TabWidget({super.key ,required this .tabName1,required this .tabName2});


  @override
  Widget build(BuildContext context) {
    return Padding( padding: const EdgeInsets.all(8.0),
      child: TabBar(indicatorWeight: 0,dividerHeight: 0,padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,indicatorPadding: EdgeInsets.zero,
        labelColor: Colors.white,
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.defaultSize),color:  Theme.of(context).primaryColor,),
        tabs: [
          Center(child: Tab( text: tabName1,)),
          Center(child: Tab(text: tabName2,)),
        ],),);
  }
}
