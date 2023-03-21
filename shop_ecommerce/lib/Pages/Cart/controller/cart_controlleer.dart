import 'package:get/get.dart';
import 'package:shop_ecommerce/Network/models/cart_items.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';

class CartController extends GetxController {
  RxList<CartItem> items = <CartItem>[].obs;
  RxDouble total = 0.0.obs;
  void addtoCart(Shoe shoe) {
    // ignore: unused_local_variable
    for (var item in items) {
      if (item.shoe.id == shoe.id) {
        items[items.indexOf(item)].quality += 1;
        return;
      }
    }
    items.add(CartItem(
      shoe: shoe,
    ));
    calTotal();
    update();
  }

  void addQuality(CartItem item) {
    item.quality++;
    calTotal();
    update();
  }

  void lowQuality(CartItem item) {
    if (item.quality > 1) {
      item.quality--;
    } else {
      items.remove(item);
    }
    calTotal();
    update();
  }

  void calTotal() {
    total.value = 0;
    for (var item in items) {
      total.value += item.shoe.price * item.quality;
    }
  }
}
