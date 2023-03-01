import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/order_body.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                height: 1.h * 0.05,
                width: 1.h * 0.05,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(''), fit: BoxFit.cover)),
              ),
            ),
            Text(
              "Your Orders",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
      body: OrderBody(),
    );
  }
}
