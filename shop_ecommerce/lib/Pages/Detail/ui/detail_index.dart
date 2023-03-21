import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';
import 'package:shop_ecommerce/Pages/Home/data/shoes.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';
import 'package:shop_ecommerce/Routes/routes.dart';

class DetailPage extends StatefulWidget {
  final Shoe shoe;
  const DetailPage({super.key, required this.shoe});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20,
                      horizontal: Dimensions.width30)),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back)),
                    const MyText(
                      text: 'Details Products',
                      size: 18,
                      color: AppColors.text1Color,
                      weight: FontWeight.w400,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Get.toNamed(Routes.cart);
                      },
                      icon: Badge(
                        //badgeContent: const Text('1'),
                        badgeContent: Obx(() => MyText(
                              text: Get.find<CartController>()
                                  .items
                                  .length
                                  .toString(),
                              color: Colors.white,
                            )),
                        child: SvgPicture.asset('icons/Buy.svg'),
                      ),
                      iconSize: Dimensions.iconSize26,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                widget.shoe.cover,
                width: double.infinity,
                height: Dimensions.detailCoverHeight,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: widget.shoe.name,
                          size: Dimensions.font20,
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: Dimensions.height5,
                        ),
                        Row(
                          children: [
                            MyText(
                              text:
                                  '\$ ${widget.shoe.price.toStringAsFixed(2)}',
                              size: Dimensions.font20,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            MyText(
                              text:
                                  '(${widget.shoe.buyersNum} people buy this )',
                              size: Dimensions.font16,
                              color: AppColors.text1Color,
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: Dimensions.height5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          color: AppColors.secondary.withOpacity(.1)),
                      child: Center(
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'icons/Heart.svg',
                            height: Dimensions.height30,
                            width: Dimensions.width30,
                            color: widget.shoe.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              for (var item in all) {
                                widget.shoe.id == item.id
                                    ? all[all.indexOf(item)].isFavorite =
                                        !all[all.indexOf(item)].isFavorite
                                    : null;
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height20, left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Choose Color',
                      size: Dimensions.font16,
                      color: AppColors.text2Color,
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            5,
                            (index) => Container(
                                  height: Dimensions.height50,
                                  width: Dimensions.width60,
                                  decoration: BoxDecoration(
                                      color: widget.shoe.colors[index],
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius8)),
                                )))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height20, left: 17, right: 17),
                child: const Divider(
                  thickness: 1.1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 17, right: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(
                      text: 'Description',
                      size: 18,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    MyText(
                      text: widget.shoe.desc,
                      size: Dimensions.font14,
                      lineHeight: 1.5,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: SizedBox(
          height: Dimensions.height100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: Dimensions.width60 * 3,
                height: Dimensions.width60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.main)),
                  onPressed: () =>
                      Get.find<CartController>().addtoCart(widget.shoe),
                  child: const Text('Add to Cart'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: Dimensions.width60 * 3,
                height: Dimensions.width60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFF0F2F1))),
                  onPressed: () {
                    Get.find<CartController>().addtoCart(widget.shoe);
                    Get.toNamed(Routes.cart);
                  },
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
