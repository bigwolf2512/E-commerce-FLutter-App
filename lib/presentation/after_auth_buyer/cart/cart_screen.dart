import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../data/controller/cart_controller.dart';
import '../../../design/extension/double_extension.dart';
import 'widget/cart_body.dart';
import 'widget/cart_bottom_bar.dart';

class CartHomePage extends StatefulWidget {
  const CartHomePage({Key? key}) : super(key: key);

  @override
  State<CartHomePage> createState() => _CartPageState();
}

class _CartPageState extends State<CartHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        flexibleSpace: GetBuilder<CartController>(builder: (controller) {
          return Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  SizedBox(width: 0.16.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Cart',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${controller.getTotalProductsInCart} products',
                          style: Theme.of(context).textTheme.caption)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          );
        }),
      ),
      body: CartScreenBody(),
      bottomNavigationBar: CartScreenBottomBar(),
    );
  }
}
