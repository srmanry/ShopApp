import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/feature/cart/presentation/widgets/quantity_widget.dart';
import 'package:test_project/helper/price_converter.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class CartWidget extends StatelessWidget {
  final int index;
  final bool fromCheckout;
  const CartWidget({super.key, required this.index, this.fromCheckout = false});

  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,0),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.15), width: .75)),
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(extentRatio: .25,
            motion: const ScrollMotion(), children: [
              SlidableAction(
                onPressed: (value){

                },
                backgroundColor: Theme.of(context).colorScheme.error.withOpacity(.05),
                foregroundColor: Theme.of(context).colorScheme.error,
                icon: CupertinoIcons.delete_solid,

                label: "delete".tr,
              ),
            ],
          ),


          child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:  MainAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                  border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.10),width: 0.5)),
                child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    child: const CustomImage(image: '', height: 70, width: 70,)))),


            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(children: [
                    Expanded(child: Text("Product Name", maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault))),
                    const SizedBox(width: Dimensions.paddingSizeSmall)]),
                  const SizedBox(height: Dimensions.paddingSizeSmall,),



                  Row(children: [
                    Text(PriceConverter.convertPrice(context, 234),maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: textMedium.copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough)),
                     SizedBox(width: Dimensions.fontSizeSmall,),


                    Text(PriceConverter.convertPrice(context, 345, discount: 3,discountType: 'amount'),
                      maxLines: 1,overflow: TextOverflow.ellipsis,
                      style: textBold.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge),)])]))),

            Container(
                decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.05),
                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.075)),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(Dimensions.paddingSizeExtraSmall),
                    topRight: Radius.circular(Dimensions.paddingSizeExtraSmall))),
              width: 40, height: 100,child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  QuantityButton(index: index, isIncrement: true, quantity: 7, maxQty: 12, minimumOrderQuantity: 2),
                  const Text("4", style: textRegular),
                  QuantityButton(isIncrement: false, index: index, quantity: 7, maxQty: 12, minimumOrderQuantity:2)])))

          ]),
        ),
      ),
    );
  }
}



