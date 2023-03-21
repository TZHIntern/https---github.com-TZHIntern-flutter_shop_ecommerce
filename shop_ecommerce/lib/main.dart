import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_ecommerce/Pages/Home/ui/widgets/banner.dart';
import 'package:shop_ecommerce/Routes/pages.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 30, 30, 29)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      //home: Banners(),
    );
  }
}
