import 'package:flutter/animation.dart';

class Shoe {
  late int id;
  late String name;
  late double price;
  late List<Color> colors;
  late String desc;
  late int buyersNum;
  late bool isFavorite;
  late String cover;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.colors,
    required this.desc,
    required this.buyersNum,
    required this.isFavorite,
    required this.cover,
  });
  @override
  String toString() {
    return 'Shoe(id: $id, name: $name, price: $price, colors: $colors, desc: $desc, buyersNum: $buyersNum, isFavorite: $isFavorite, cover: $cover)';
  }
}
