import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';

Faker faker = Faker();
Random random = Random();

List<Color> randomColors() {
  List<Color> colors = [];
  for (var i = 0; i < 5; i++) {
    colors
        .add(Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0));
  }
  return colors;
}

List<Shoe> all = [
  randomShoe(1, 'images/1.jpg'),
  randomShoe(2, 'images/2.jpg'),
  randomShoe(3, 'images/3.jpg'),
  randomShoe(4, 'images/4.jpg'),
  randomShoe(5, 'images/5.jpg'),
  randomShoe(6, 'images/6.jpg'),
  randomShoe(7, 'images/7.jpg'),
  randomShoe(8, 'images/8.jpg'),
  randomShoe(9, 'images/9.jpg'),
  randomShoe(10, 'images/10.jpg'),
];
List<Shoe> recent = all.take(6).toList();

Shoe randomShoe(int i, String cover) {
  return Shoe(
      id: i,
      name: faker.lorem.words(2).join(' '),
      price: random.nextDouble() * 500,
      colors: randomColors(),
      desc: faker.lorem.sentences(5).join('.'),
      buyersNum: random.nextInt(200),
      isFavorite: random.nextBool(),
      cover: cover);
}
