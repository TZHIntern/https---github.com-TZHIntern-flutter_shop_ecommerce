import 'dart:ffi';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';
import 'package:shop_ecommerce/Pages/Cart/controller/cart_controlleer.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/recent_products.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/searchbox.dart';
import 'package:shop_ecommerce/Pages/Search/controller/search_controller.dart';
import 'package:shop_ecommerce/Routes/routes.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      SizedBox(
                        width: Get.width / 1.5,
                        child: Searchbox(
                          controller:
                              Get.put(SearchController()).searchController,
                          onsearch: controller.onSearch,
                        ),
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
                const Divider(
                  thickness: 1.1,
                ),
                Obx(() => controller.search.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: controller.isLoading.value
                                  ? 'Searching'
                                  : 'Searching for "${controller.search}"',
                              size: 14,
                            ),
                            IconButton(
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'icons/Filter.svg',
                                  height: Dimensions.height20,
                                  width: Dimensions.width20,
                                ))
                          ],
                        ),
                      )
                    : Container()),
                Obx(() => controller.isLoading.value
                    ? SizedBox(
                        width: double.infinity,
                        height: Get.height / 1.5,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.main,
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: Dimensions.cardHeight),
                          itemCount: controller.searchedShoe.length,
                          itemBuilder: (context, index) {
                            Shoe shoe = controller.searchedShoe[index];
                            return ShoeCard(shoe: shoe);
                          },
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
