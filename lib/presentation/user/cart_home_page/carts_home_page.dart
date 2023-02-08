import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/cart_controller.dart';
import 'components/body.dart';
import 'components/bottom_bar.dart';
import 'components/header.dart';

class CartHomePage extends StatefulWidget {
  const CartHomePage({Key? key}) : super(key: key);

  @override
  State<CartHomePage> createState() => _CartPageState();
}

class _CartPageState extends State<CartHomePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().initCheckOutItems();
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
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
    backgroundColor: Colors.white,
    flexibleSpace: buildAppBarDetail(
      size: size,
    ),
  );
}
