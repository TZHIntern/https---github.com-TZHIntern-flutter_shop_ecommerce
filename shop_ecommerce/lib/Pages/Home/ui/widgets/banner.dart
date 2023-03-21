import 'package:flutter/cupertino.dart';

import 'package:shop_ecommerce/Core/util/dimentions.dart';

class Banners extends StatelessWidget {
  Banners({super.key});
  final List<String> banners = [
    'images/banner 1.png',
    //'images/banner 4.png',
    'images/banner 3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      height: Dimensions.carousel,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius8),
                child: Image.asset(
                  banners[index],
                  height: Dimensions.bannerHeight,
                  width: Dimensions.bannerWidth,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          separatorBuilder: ((_, __) => SizedBox(
                width: Dimensions.width15,
              )),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 2),
    );
  }
}
