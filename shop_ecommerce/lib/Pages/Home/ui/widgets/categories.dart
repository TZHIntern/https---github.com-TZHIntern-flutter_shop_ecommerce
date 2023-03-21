import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';

import 'package:shop_ecommerce/Core/util/dimentions.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/my_text.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: Dimensions.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
                text: 'Category',
                size: Dimensions.font16,
                weight: FontWeight.w500),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryIConText(label: 'Apparel', icon: 'icons/shoe 4.svg'),
                  CategoryIConText(label: 'School', icon: 'icons/shoe 2.svg'),
                  CategoryIConText(label: 'Sports', icon: 'icons/shoe 3.svg'),
                  CategoryIConText(label: 'Party', icon: 'icons/shoe 1.svg'),
                  CategoryIConText(label: 'All', icon: 'icons/all.svg'),
                ],
              ),
            )
          ],
        ));
  }
}

class CategoryIConText extends StatelessWidget {
  final String label;
  final String icon;
  const CategoryIConText({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.height5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                color: AppColors.main.withOpacity(0.2)),
            child: SvgPicture.asset(
              icon,
              height: Dimensions.height40,
              width: Dimensions.width40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: Dimensions.height5),
          MyText(
            text: label,
            size: Dimensions.font14,
            color: AppColors.secondary,
          )
        ],
      ),
    );
  }
}
