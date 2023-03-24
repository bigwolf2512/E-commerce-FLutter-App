import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../design/extension/double_extension.dart';
import '../../../../share/constant/constant.dart';

class ConfirmOrderBottom extends StatelessWidget {
  const ConfirmOrderBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
        height: 0.2.h,
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
                  height: 0.07.h,
                  width: 0.07.h,
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
                    SizedBox(width: 0.005.h),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kTextColor,
                      size: 15,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 0.005.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 0.08.h,
                  width: 0.3.w,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(color: kTextColor),
                      ),
                      SizedBox(height: 0.003.h),
                      Text(
                        '${controller.getTotalPrice}',
                        style: TextStyle(color: kAccentColor, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.createOrder(context);
                  },
                  child: Container(
                    height: 0.07.h,
                    width: 0.5.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 0.001.w),
                        Text.rich(TextSpan(children: const [
                          TextSpan(
                              text: 'Confirm To Pay',
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
