import 'package:flutter/material.dart';
import 'package:test_project/common/widget/custom_delegate.dart';
import 'package:test_project/feature/category/presentation/widgets/category_list_widget.dart';
import 'package:test_project/feature/banner/presentation/banners_section.dart';
import 'package:test_project/feature/home/widget/cart_widget_home_page.dart';
import 'package:test_project/feature/home/widget/search_widget_home_page.dart';
import 'package:test_project/feature/product/presentation/screens/product_list_screen.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(floating: true, elevation: 1, centerTitle: false,
          automaticallyImplyLeading: false, backgroundColor: Theme.of(context).cardColor,
          title: Image.asset(Images.logo, height: 35), actions:  const [CartWidgetHomePage()]),


        SliverPersistentHeader(pinned: true,
            delegate: SliverDelegate(child: InkWell(onTap: () {}, child: const SearchWidgetHomePage()))),

        const SliverToBoxAdapter(child: Column(children: [
          BannersSection(),
          Padding(padding: EdgeInsets.only(left: Dimensions.paddingSizeDefault),
            child: CategoryListWidget(),),

          Padding(padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
            child: ProductListSection(),
          )

        ],),)
      ],),
    );
  }
}


