import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_ecommerce/Core/theme/colors.dart';
import 'package:shop_ecommerce/Core/util/dimentions.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? textOverflow;
  final double? lineHeight;

  const MyText(
      {super.key,
      required this.text,
      this.color = AppColors.text1Color,
      this.size = 0,
      this.weight = FontWeight.w400,
      this.textOverflow,
      this.lineHeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font12 : size,
        color: color,
        fontWeight: weight,
        height: lineHeight,
      ),
    );
  }
}
