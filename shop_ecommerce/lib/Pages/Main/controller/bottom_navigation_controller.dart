import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Pages/Home/ui/index.dart';

class BottomNavigatorController extends GetxController {
  RxInt index = 0.obs;
  var views = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  void changeIndex(int i) => index.value = i;
}
