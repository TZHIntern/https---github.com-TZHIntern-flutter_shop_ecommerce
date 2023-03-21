import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shop_ecommerce/Pages/Cart/ui/cart_index.dart';
import 'package:shop_ecommerce/Pages/Home/ui/index.dart';
import 'package:shop_ecommerce/Pages/Main/binding/main_binding.dart';
import 'package:shop_ecommerce/Pages/Main/ui/index.dart';
import 'package:shop_ecommerce/Pages/Search/ui/searched_index.dart';
import 'package:shop_ecommerce/Routes/routes.dart';

class Pages {
  static final List<GetPage<dynamic>> pages = [
    GetPage<HomePage>(
        name: Routes.initial,
        page: () => const Main(),
        binding: MainBindings(),
        transition: Transition.fadeIn,
        preventDuplicates: true),
    GetPage<HomePage>(
        name: Routes.home,
        page: () => const HomePage(),
        transition: Transition.fadeIn,
        preventDuplicates: true),
    GetPage<SearchPage>(
        name: Routes.search,
        page: () => const SearchPage(),
        transition: Transition.fadeIn,
        preventDuplicates: true),
    GetPage<CartPage>(
        name: Routes.cart,
        page: () => const CartPage(),
        transition: Transition.fadeIn,
        preventDuplicates: true)
  ];
}
