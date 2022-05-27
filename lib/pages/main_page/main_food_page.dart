// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:ecommerceshop/app_const/app_const.dart';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/data/controller/recommended_product_controller.dart';
import 'package:ecommerceshop/pages/personal_page/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/auth_controller.dart';
import '../../data/controller/cart_controller.dart';
import '../cart_page/carts_page.dart';
import '../home_page/food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  List pages = [
    Container(
      child: FoodPageBody(),
    ),
    Container(
      child: Center(child: Text("Cart Page")),
    ),
    Container(
      child: CartPage(),
    ),
    Container(
      child: PersonalPage(),
    ),
  ];
  int isSelected = 0;
  void _onItemTapped(int index) {
    setState(() {
      isSelected = index;
      Get.find<PopularProductController>().getpopularproductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text("Back again to exit."),
          backgroundColor: Colors.black,
        ),
        child: Container(
          child: pages[isSelected],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp),
            activeIcon: Icon(Icons.history_rounded),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person_rounded),
            label: "Personal",
          ),
        ],
        currentIndex: isSelected,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        backgroundColor: kPrimaryLightColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
