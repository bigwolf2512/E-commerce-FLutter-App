import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_const/app_const.dart';
import '../../../components/button_flat.dart';

import '../../../route_helper/route_helper.dart';

class Cart_and_notification extends StatelessWidget {
  const Cart_and_notification({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartcontroller) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            GestureDetector(
              onTap: () {
                RouteHelper.getCartPage(context);
              },
              child: ButtonFlat(
                color: kSecondaryColor,
                images: "assets/icons/Cart Icon.svg",
                itemsNumber: cartcontroller.lengthCart,
                padding: size.width * 0.025,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            ButtonFlat(
              color: kSecondaryColor,
              images: "assets/icons/Bell.svg",
              itemsNumber: 12,
              padding: size.width * 0.025,
            ),
            SizedBox(width: 10),
          ]),
        );
      },
    );
  }
}
