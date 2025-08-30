import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class CustomAuthScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? topTitleWidget;
  final String? title;
  final String? subTitle;
  final double? toolbarHeight;
  final Color?color;
  final Widget? bottom;
  final Function()? onBackPress;
  const CustomAuthScreenAppBar({super.key, this.topTitleWidget, this.title, this.subTitle, this.toolbarHeight, this.bottom, this.onBackPress, this.color})/* : assert((toolbarHeight??0) >= 60 ,"Height Must be > 60")*/;

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).viewPadding.top;
    bool isRouteTreeEmpty = Navigator.of(context).canPop();
    return Container(
      decoration: BoxDecoration(
          color:color,
          image: DecorationImage(image: const AssetImage(Images.worldMapImage),
              fit:BoxFit.fitWidth,
              colorFilter:ColorFilter.mode(Theme.of(context).cardColor.withOpacity(0.1), BlendMode.srcIn))
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              if(isRouteTreeEmpty)
              Padding(
                padding: EdgeInsets.only(top: topPadding+8 ),
                child: IconButton(onPressed: () => onBackPress != null ? onBackPress?.call() : Get.back(), icon: Icon(Icons.arrow_back,color: Theme.of(context).cardColor,)),
              ),
              Expanded(child: topTitleWidget??const SizedBox.shrink())
            ],
          ),


        if(bottom != null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: bottom??const SizedBox.shrink(),
          ),
        ]else if(subTitle == null && title != null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Text(title??"",maxLines: 1,overflow: TextOverflow.fade, style: textSemiBold.copyWith(
                color: Theme.of(context).cardColor, fontSize: Dimensions.fontSizeOverLarge)),
          )
        ]else if(subTitle != null && title != null)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Text(title??"",maxLines: 1,overflow: TextOverflow.fade, style: textSemiBold.copyWith(
                color: Theme.of(context).colorScheme.secondary, fontSize: Dimensions.fontSizeOverLarge)),
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Text(subTitle??"",maxLines: 3,overflow: TextOverflow.fade, style: textRegular.copyWith(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.9), fontSize: Dimensions.fontSizeDefault)),
          )
        ]


      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? getToolbarHeight());

  double getToolbarHeight(){
    if(title == null && subTitle == null && bottom == null){
      return 60;
    }else if((subTitle == null && bottom == null) && title != null){
      return 92;
    }else{
      return 145;
    }
  }
}