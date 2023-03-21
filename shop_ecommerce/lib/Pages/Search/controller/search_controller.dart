import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/Network/models/shoe.dart';
import 'package:shop_ecommerce/Pages/Home/data/shoes.dart';

class SearchController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController(text: '');
  RxString search = ''.obs;
  RxList<Shoe> searchedShoe = <Shoe>[].obs;
  void onSearch() async {
    isLoading.value = true;
    searchedShoe.clear();
    await Future.delayed(const Duration(seconds: 2));
    search.value = searchController.text;
    if (search.isNotEmpty) {
      for (Shoe shoe in all) {
        shoe.name.contains(search) ? searchedShoe.add(shoe) : null;
      }
    } else if (search.isEmpty) {
      searchedShoe.value = <Shoe>[];
    }
    isLoading.value = false;
  }
}
