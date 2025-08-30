import 'package:flutter/material.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.name,
    this.image,
    required this.isSelect,
    required this.onSelected,
  });

  final String? name;
  final String? image;
  final bool isSelect;
  final Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,bottom: 5),
      child: ActionChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(100),
                child: Image.asset(image??Images.placeholder,height: 28,width: 28,fit: BoxFit.cover,)),

            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSix),
              child: Text(name??""),),
          ],
        ),
        labelStyle: textMedium.copyWith(color: Theme.of(context).colorScheme.secondary),
        color: MaterialStatePropertyAll(Theme.of(context).cardColor),
        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
        labelPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: onSelected,
        side: BorderSide( color: isSelect
            ? Theme.of(context).primaryColor
            : Theme.of(context).hintColor.withOpacity(0.1),
            width: isSelect ? 2 : 1.2),),
    );
  }
}