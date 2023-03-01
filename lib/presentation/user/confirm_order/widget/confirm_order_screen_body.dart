import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:ecommerceshop/presentation/user/confirm_order/widget/confirm_order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';

class ConfirmOrderBody extends StatefulWidget {
  const ConfirmOrderBody({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderBody> createState() => _ConfirmOrderBodyState();
}

class _ConfirmOrderBodyState extends State<ConfirmOrderBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 1.h * 0.12,
            width: double.maxFinite,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check Out',
                  style: TextStyle(
                      fontSize: 1.w * 0.08, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' items',
                  style: TextStyle(
                      fontSize: 1.w * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.8),
                width: 1.9,
              ),
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.8),
                width: 1.9,
              ),
            )),
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 0,
              itemBuilder: (BuildContext context, int index) {
                return ConfirmOrderItemWidget(index: index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 1.h * 0.19,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub Total',
                        style: TextStyle(
                            fontSize: 1.w * 0.05,
                            fontWeight: FontWeight.normal)),
                    Text('price',
                        style: TextStyle(
                            fontSize: 1.w * 0.05,
                            fontWeight: FontWeight.normal))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax',
                        style: TextStyle(
                            fontSize: 1.w * 0.05,
                            fontWeight: FontWeight.normal)),
                    Text('price',
                        style: TextStyle(
                            fontSize: 1.w * 0.05,
                            fontWeight: FontWeight.normal))
                  ],
                ),
                SizedBox(
                  height: 1.h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',
                        style: TextStyle(
                            fontSize: 1.w * 0.08, fontWeight: FontWeight.bold)),
                    Text('price',
                        style: TextStyle(
                            fontSize: 1.w * 0.05, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
