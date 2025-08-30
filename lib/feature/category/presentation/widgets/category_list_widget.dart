import 'package:flutter/material.dart';
import 'package:test_project/common/widget/title_row.dart';
import 'package:test_project/feature/category/domain/models/category_model.dart';
import 'package:test_project/feature/category/presentation/widgets/category_widget.dart';


class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const TitleRowWidget(title: "What You Searching...", padding: 0,),
      SizedBox(height: 210,child: GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CategoryWidget(categoryItem: CategoryItem());
        }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: 5, crossAxisSpacing: 5),
      )),
    ],);
  }
}



