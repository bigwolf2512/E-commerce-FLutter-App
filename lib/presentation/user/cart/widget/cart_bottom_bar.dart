import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../share/constant/constant.dart';

class CartScreenBottomBar extends StatelessWidget {
  const CartScreenBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        height: size.height * 0.2,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.3),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(15),
                  height: size.height * 0.07,
                  width: size.height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryLightColor,
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Row(
                  children: [
                    Text(
                      'Add voucher code',
                      style: TextStyle(color: kTextColor),
                    ),
                    SizedBox(width: size.height * 0.005),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kTextColor,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: size.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: size.height * 0.08,
                  width: size.width * 0.3,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(color: kTextColor),
                      ),
                      SizedBox(height: size.height * 0.003),
                      Text(
                        '${controller.getTotalPrice}',
                        style: TextStyle(color: kAccentColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: size.width * 0.001),
                        Text.rich(TextSpan(children: const [
                          TextSpan(
                              text: 'Check Out',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ])),
                        Icon(Icons.arrow_forward_sharp, color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
