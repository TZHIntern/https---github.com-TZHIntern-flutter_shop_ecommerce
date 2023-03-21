import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';

class Searchbox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onsearch;
  final bool? isEnable;
  const Searchbox({super.key, this.controller, this.onsearch, this.isEnable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.height15,
        bottom: Dimensions.height15,
      ),
      height: Dimensions.searchBoxHeight,
      child: TextField(
        enabled: isEnable,
        autofocus: false,
        controller: controller,
        onSubmitted: ((value) => onsearch!()),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              borderSide: const BorderSide(
                color: Color(0xFFF0F2F1),
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                borderSide: const BorderSide(color: Color(0xFFF0F2F1))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                borderSide: const BorderSide(
                  color: AppColors.main,
                )),
            hintText: 'Search here...',
            prefixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'icons/Search.svg',
                height: Dimensions.iconSize24,
                width: Dimensions.iconSize24,
              ),
              // icon: SvgPicture.ass(
              //   child: Image.asset(
              //     'icons/Search.svg',
              //     height: Dimensions.iconSize24,
              //     width: Dimensions.iconSize24,
              //   ),
              // ),
            )),
      ),
    );
  }
}
