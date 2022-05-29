import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/cart_controller.dart';
import 'components/body.dart';
import 'components/bottom_bar.dart';
import 'components/header.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().initCheckOutItems();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      appBar: appBar(context),
      body: body(),
      bottomNavigationBar: bottom(),
    );
  }
}

AppBar appBar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ),
    backgroundColor: Colors.white,
    flexibleSpace: buildAppBarDetail(
      size: size,
    ),
  );
}
