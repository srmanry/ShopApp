import 'package:get/get.dart';
import 'package:test_project/feature/product/domain/repository/product_repository.dart';

class ProductController extends GetxController implements GetxService{
  final ProductRepository productRepository;

  ProductController({required this.productRepository});
}