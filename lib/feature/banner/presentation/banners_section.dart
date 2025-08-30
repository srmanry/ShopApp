import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/feature/banner/controller/banner_controller.dart';
import 'package:test_project/feature/banner/domain/models/banner_model.dart';
import 'package:test_project/util/dimensions.dart';
class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(
      builder: (bannerController) {
        return Stack(children: [
          SizedBox(height: Get.width * 0.39, width: Get.width,
            child: Column(children: [
              SizedBox(height: Get.width * 0.33, width: Get.width,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    aspectRatio: 4/1,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    enlargeFactor: .1,
                    enlargeCenterPage: true,
                    disableCenter: true,
                    onPageChanged: (index, reason) {
                      bannerController.setCurrentIndex(index);
                    },
                  ),
                  itemCount: bannerList.length,
                  itemBuilder: (context, index, _) {

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                          color:  Theme.of(context).primaryColor.withOpacity(.05)),
                          child:  CustomImage(image: bannerList[index].bannerImage)));
                  },
                ),
              ),
            ],
            ),
          ),


            Positioned(bottom: 0, left: 0, right: 0,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: bannerList.map((banner) {
                  int index = bannerList.indexOf(banner);
                  return index == bannerController.currentIndex ? Container(
                    width: 25,height: 8,
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      color:  Theme.of(context).primaryColor ,
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ):Container(height: 7, width: 7,
                    margin:  const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration:  BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList(),
              ),
            ),

        ],);
      }
    );
  }


}

