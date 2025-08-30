import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/feature/category/domain/models/category_model.dart';
import 'package:test_project/util/dimensions.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryItem? categoryItem;
  const CategoryWidget({super.key, this.categoryItem});

  @override
  Widget build(BuildContext context) {

    return Container(height: MediaQuery.of(context).size.width/6.5, width: MediaQuery.of(context).size.width/6.5, decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
      child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
        child: const CustomImage(image: "",)));
  }
}
