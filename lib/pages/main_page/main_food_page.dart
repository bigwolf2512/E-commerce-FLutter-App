// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:ecommerceshop/app_const/app_const.dart';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/pages/personal_page/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart_home_page/carts_home_page.dart';
import '../home_page/food_page_body.dart';
import '../order_page/order_page.dart';

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
      child: OrderPage(),
    ),
    Container(
      child: CartHomePage(),
    ),
    Container(
      child: PersonalPage(),
    ),
  ];
  int isSelected = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        isSelected = index;
        Get.find<PopularProductController>().getpopularproductList();
      },
    );
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
            icon: Icon(Icons.archive_outlined),
            activeIcon: Icon(Icons.archive_rounded),
            label: "Order",
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
