import 'package:badges/badges.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/banner.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/categories.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/recent_products.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/searchbox.dart';
import 'package:shop_ecommerce/Routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: MyText(
                        text: 'Delivery Address',
                        color: AppColors.text2Color,
                      ),
                    ),
                    MyText(
                        text: 'Salatiga City, Central Java',
                        weight: FontWeight.w500)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        //Get.find<CartController>().addtoCart(widget.shoe);
                        Get.toNamed(Routes.cart);
                      },
                      icon: Badge(
                        //badgeContent: const Text('1'),
                        badgeContent: Obx(() => MyText(
                              text: Get.put(CartController())
                                  .items
                                  .length
                                  .toString(),
                              color: Colors.white,
                            )),
                        child: SvgPicture.asset('icons/Buy.svg'),
                      ),
                      iconSize: Dimensions.iconSize26,
                    ),
                    SizedBox(
                      width: Dimensions.width15,
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(top: 7),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: SvgPicture.asset('icons/Notification.svg'),
                      iconSize: Dimensions.iconSize26,
                    )
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.search),
              child: const Searchbox(
                isEnable: false,
              ),
            ),
            Banners(),
            const Categories(),
            const RecentProducts()
          ],
        ),
      ),
    );
  }
}
