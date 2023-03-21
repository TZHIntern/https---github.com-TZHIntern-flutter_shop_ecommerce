import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Network/models/cart_items.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';
import 'package:shop_ecommerce/Pages/Detail/ui/detail_index.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';
import 'package:shop_ecommerce/Routes/routes.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                    Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back)),
                        SizedBox(
                          width: Dimensions.width45,
                        ),
                        const MyText(
                          text: 'Your Cart',
                          size: 18,
                          color: AppColors.text1Color,
                          weight: FontWeight.w400,
                        )
                      ],
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
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
              SizedBox(
                height: Dimensions.height30,
                child: const Divider(
                  thickness: 1.1,
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height5,
                      horizontal: Dimensions.width30)),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyText(
                      text: 'Delivery to',
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    MyText(
                      text: 'Salatiga City, Central Java',
                      size: 14,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height35,
                child: const Divider(
                  thickness: 1.1,
                ),
              ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      return CartItemView(item: controller.items[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 20,
        child: SizedBox(
          height: Dimensions.height100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 17, right: 17, top: Dimensions.height15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Totals',
                      size: Dimensions.font16,
                    ),
                    Obx(() => MyText(
                          text: '\$${controller.total.toStringAsFixed(2)}',
                          size: Dimensions.font16,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                width: double.infinity,
                height: Dimensions.width40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.main)),
                  onPressed: () =>
                      Get.snackbar('OOPS!', "Server's not responding"),
                  child: const Text('Continue to Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItemView extends StatelessWidget {
  final CartItem item;
  const CartItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailPage(shoe: item.shoe)),
      child: Container(
        padding: EdgeInsets.all(
          Dimensions.height15,
        ),
        child: Container(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius8),
                  child: Image.asset(
                    item.shoe.cover,
                    height: Dimensions.height100,
                    width: Dimensions.width100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height5,
                  ),
                  height: Dimensions.height100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: item.shoe.name,
                        size: 16,
                      ),
                      Row(
                        children: [
                          MyText(
                            text: '\$${item.shoe.price.toStringAsFixed(2)}',
                            size: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () => Get.find<CartController>()
                                      .addQuality(item),
                                  icon: const Icon(Icons.add)),
                              MyText(text: item.quality.toString()),
                              IconButton(
                                  onPressed: () => Get.find<CartController>()
                                      .lowQuality(item),
                                  icon: const Icon(Icons.remove)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
