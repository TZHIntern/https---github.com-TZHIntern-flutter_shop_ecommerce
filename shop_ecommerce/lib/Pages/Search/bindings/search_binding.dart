import 'package:get/get.dart';
import 'package:shop_ecommerce/Pages/Search/controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
