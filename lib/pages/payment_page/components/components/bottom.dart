import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/route_helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottom extends StatelessWidget {
  const bottom({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CartController>().setOrderItems();
        getMainPage(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(),
        height: size.height * 0.07,
        width: size.width * 0.55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.black),
        child: Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Pay Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getMainPage(BuildContext context) async {
    return await RouteHelper.getMainPage(context);
  }
}
