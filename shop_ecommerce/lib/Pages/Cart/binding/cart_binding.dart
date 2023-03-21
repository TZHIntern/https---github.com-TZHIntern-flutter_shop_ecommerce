import 'package:get/get.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
