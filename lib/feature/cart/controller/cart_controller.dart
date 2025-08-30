import 'package:get/get.dart';
import 'package:test_project/feature/cart/domain/repository/cart_repository.dart';

class CartController extends GetxController implements GetxService{
  final CartRepository cartRepository;
  CartController({required this.cartRepository});

}