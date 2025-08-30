import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_app_bar.dart';
import 'package:test_project/common/widget/paginated_list_widget.dart';
import 'package:test_project/feature/cart/presentation/widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'cart',),
      body: SingleChildScrollView(
        controller: scrollController,
        child: PaginatedListWidget(
          scrollController: scrollController,
          totalSize: 10,
          offset: 1,
          onPaginate: (int? offset) async {

          },
          itemView: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return const CartWidget(index: 0,);
            },
          ),
        ),
      ),
    );
  }
}
