import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/cart_controller.dart';
import 'widget/cart_body.dart';
import 'widget/cart_bottom_bar.dart';
import 'widget/cart_header.dart';

class CartHomePage extends StatefulWidget {
  const CartHomePage({Key? key}) : super(key: key);

  @override
  State<CartHomePage> createState() => _CartPageState();
}

class _CartPageState extends State<CartHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: appBar(context),
      body: CartScreenBody(),
      bottomNavigationBar: CartScreenBottomBar(),
    );
  }
}

AppBar appBar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    shadowColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    flexibleSpace: CartHeader(
      size: size,
    ),
  );
}
