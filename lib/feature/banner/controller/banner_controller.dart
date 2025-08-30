import 'package:get/get.dart';
import 'package:test_project/feature/banner/domain/repository/banner_repository.dart';

class BannerController extends GetxController implements GetxService{
  final BannerRepository bannerRepository;
  BannerController({required this.bannerRepository});

  int currentIndex = 0;
  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}