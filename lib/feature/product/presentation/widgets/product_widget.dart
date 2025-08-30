import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/feature/product/domain/models/product_model.dart';
import 'package:test_project/feature/product/presentation/widgets/favourite_button.dart';
import 'package:test_project/helper/price_converter.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class ProductWidget extends StatelessWidget {
  final Product productModel;
  const ProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    var darkTheme = Get.find<ThemeController>().darkTheme;
    return InkWell(onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: darkTheme? null : [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(height: 140, decoration: BoxDecoration(
                color: darkTheme? Theme.of(context).primaryColor.withOpacity(.05) : Theme.of(context).hintColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: CustomImage(image: '',
                  height: MediaQuery.of(context).size.width/2.45,width: MediaQuery.of(context).size.width))),

            // Product Details
            Padding(padding: const EdgeInsets.only(top :Dimensions.paddingSizeSmall,bottom: 5, left: 5,right: 5),
              child: Center(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [


                  Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeExtraSmall),
                    child: Text('out_of_stock'.tr, style: textRegular.copyWith(color: const Color(0xFFF36A6A)))),


                    Padding(padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(productModel.name ?? '', textAlign: TextAlign.center,
                          style: textBold.copyWith(fontSize: Dimensions.fontSizeDefault), maxLines: 2,
                          overflow: TextOverflow.ellipsis)),






                      productModel.discount!= null && productModel.discount! > 0 ?
                      Text(PriceConverter.convertPrice(context, 6767),
                      style: textRegular.copyWith(color: Theme.of(context).colorScheme.error,
                        decoration: TextDecoration.lineThrough,
                          fontSize: Dimensions.fontSizeSmall)) : const SizedBox.shrink(),
                    const SizedBox(height: 2,),


                    Text(PriceConverter.convertPrice(context, 78, discountType: productModel.discountType,
                        discount: productModel.discount),
                      style: textSemiBold.copyWith(color: Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            ),
          ]),

          // Off


          Positioned(top: 10, left: 0, child: Container(height: 20,
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(Dimensions.paddingSizeExtraSmall), bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall)),),

              child: Center(child: Text(PriceConverter.percentageCalculation(context, "78", "67", "amount"),
                  style: textRegular.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.fontSizeSmall)),
              ),
            ),
          ),

          Positioned(top: 5, right: 5, child: FavouriteButton(productId: productModel.id),
          ),
        ]),
      ),
    );
  }
}
