import 'package:flutter/material.dart';
import 'package:frontend/ui/Home/menu.dart';
import 'package:frontend/ui/Products/listProduct.dart';
import 'package:get/get_navigation/get_navigation.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Menu(),
        "/listproduct": (context) => const ProductList(),
      },
    );
  }
}
