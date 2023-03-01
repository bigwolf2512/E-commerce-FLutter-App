import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../share/constant/constant.dart';
import '../../../share/widget/button_flat.dart';

class CartAndNotification extends StatelessWidget {
  const CartAndNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        GestureDetector(
          onTap: () {},
          child: ButtonFlat(
            color: kSecondaryColor,
            images: "assets/icons/Cart Icon.svg",
            itemsNumber: 0,
            padding: 1.w * 0.025,
          ),
        ),
        SizedBox(width: 1.w * 0.03),
        ButtonFlat(
          color: kSecondaryColor,
          images: "assets/icons/Bell.svg",
          itemsNumber: 12,
          padding: 1.w * 0.025,
        ),
        SizedBox(width: 10),
      ]),
    );
  }
}
