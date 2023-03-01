import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/popular_product_controller.dart';
import '../../share/constant/constant.dart';
import 'food_page_body.dart';
import '../merchant/manage_order/manage_order_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<HomePage> {
  List pages = [
    Container(
      child: FoodPageBody(),
    ),
    Container(
      child: OrderPage(),
    ),
  ];
  int isSelected = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        isSelected = index;
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
        backgroundColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
