import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Pages/Main/controller/bottom_navigation_controller.dart';

class Main extends GetView<BottomNavigatorController> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: FocusScope.of(context).unfocus(),
      child: Obx(() => Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              child: IndexedStack(
                index: controller.index.value,
                children: controller.views,
              ),
            )),
            bottomNavigationBar: Obx(() => SizedBox(
                  height: Dimensions.bottomAppBar,
                  child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: BottomBarIcon(
                            index: 0,
                            current_index: controller.index.value,
                            path: 'icons/Home.svg',
                          ),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: BottomBarIcon(
                            index: 1,
                            current_index: controller.index.value,
                            path: 'icons/Heart.svg',
                          ),
                          label: 'Whishlist'),
                      BottomNavigationBarItem(
                          icon: BottomBarIcon(
                            index: 2,
                            current_index: controller.index.value,
                            path: 'icons/Paper.svg',
                          ),
                          label: 'History'),
                      BottomNavigationBarItem(
                          icon: BottomBarIcon(
                            index: 4,
                            current_index: controller.index.value,
                            path: 'icons/Profile.svg',
                          ),
                          label: 'Account'),
                    ],
                    currentIndex: controller.index.value,
                    selectedItemColor: AppColors.main,
                    unselectedItemColor: AppColors.secondary,
                    onTap: controller.changeIndex,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                  ),
                )),
          )),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final int index;
  final int current_index;
  final String path;
  const BottomBarIcon(
      {super.key,
      required this.index,
      required this.current_index,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      child: SvgPicture.asset(path,
          color: current_index == index ? AppColors.main : AppColors.secondary),
    );
  }
}
