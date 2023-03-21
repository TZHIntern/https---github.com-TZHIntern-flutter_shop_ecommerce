import 'package:shop_ecommerce/Network/models/shoe.dart';

class CartItem {
  late Shoe shoe;
  late int quality;
  CartItem({required this.shoe, this.quality = 1});

  @override
  String toString() => 'CartItem(shoe: $shoe, quality: $quality)';
}
