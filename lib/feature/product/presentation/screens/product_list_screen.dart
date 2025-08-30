import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_project/common/widget/paginated_list_widget.dart';
import 'package:test_project/feature/product/domain/models/product_model.dart';
import 'package:test_project/feature/product/presentation/widgets/product_widget.dart';
import 'package:test_project/util/dimensions.dart';

class ProductListSection extends StatefulWidget {
  const ProductListSection({super.key});

  @override
  State<ProductListSection> createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: SingleChildScrollView(
        controller: scrollController,
        child: PaginatedListWidget(
          scrollController: scrollController,
          totalSize: 10,
          offset: 1,
          onPaginate: (int? offset) async {

          },
          itemView: MasonryGridView.count(
            itemCount: 10,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(productModel: Product(),);
            }, crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
