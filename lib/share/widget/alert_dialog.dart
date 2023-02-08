import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/data/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/popular_product_controller.dart';

confirmAlertCartPage(BuildContext context, int cartID) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return GetBuilder<CartController>(builder: (cartController) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove this item?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    var product =
                        Get.find<ProductController>().productList[cartID];
                    Get.find<CartController>().removeItems(product, true);
                    Navigator.of(context).pop();
                    Get.snackbar("Notification", "Remove successfull",
                        colorText: Colors.white,
                        backgroundColor: Colors.deepOrange);
                  },
                  child: const Text('Confirm')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
      });
}
