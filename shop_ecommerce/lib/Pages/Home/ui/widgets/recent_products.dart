import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';
import 'package:shop_ecommerce/Pages/Detail/ui/detail_index.dart';
import 'package:shop_ecommerce/Pages/Home/data/shoes.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';

class RecentProducts extends StatelessWidget {
  const RecentProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: 'Recent Products',
              size: Dimensions.font16,
              weight: FontWeight.w500,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'icons/Filter.svg',
                  width: Dimensions.width20,
                  height: Dimensions.width20,
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: Dimensions.cardHeight),
          itemCount: recent.length,
          itemBuilder: (context, index) {
            Shoe shoe = recent[index];
            return ShoeCard(shoe: shoe);
          },
        )
      ],
    );
  }
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  const ShoeCard({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Get.to(DetailPage(
            shoe: shoe,
          ))),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius8),
                topRight: Radius.circular(Dimensions.radius8))),
        elevation: .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius8),
                  topRight: Radius.circular(Dimensions.radius8)),
              child: Image.asset(
                shoe.cover,
                height: Dimensions.coverHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height10, left: Dimensions.width15),
              child: MyText(
                text: shoe.name,
                size: 14,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Dimensions.height5,
                  bottom: Dimensions.height15,
                  left: Dimensions.width15),
              child: MyText(
                text: '\$${shoe.price.toStringAsFixed(2)}',
                size: 15,
                weight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: double.infinity,
                height: Dimensions.width45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.main)),
                  onPressed: () => Get.find<CartController>().addtoCart(shoe),
                  child: const Text('Add to cart'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
