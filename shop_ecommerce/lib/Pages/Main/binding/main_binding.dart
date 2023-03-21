import 'package:get/get.dart';
import 'package:shop_ecommerce/Pages/Main/controller/bottom_navigation_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigatorController());
  }
}
