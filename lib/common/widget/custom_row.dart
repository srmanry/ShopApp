
import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';


class CustomRowWidget extends StatelessWidget {
 final Widget leadingIcon;
 final String title;
 final Function()?onTap;
  const CustomRowWidget({super.key,required this.title, required  this.leadingIcon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
       leadingIcon,
        const SizedBox(width: Dimensions.fifTeen,),
        Expanded( child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ Text(title),
              InkWell(onTap: onTap,
                child: const Icon(Icons.arrow_forward_ios,size: Dimensions.twenty,)),],), )
      ], );
  }
}
