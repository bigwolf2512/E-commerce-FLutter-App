import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../data/controller/cart_controller.dart';
import 'payment_item_widget.dart';

class PaymentBody extends StatefulWidget {
  const PaymentBody({Key? key}) : super(key: key);

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final listTransactions = List<Row>.generate(
      3,
      (i) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Name',
              style: TextStyle(
                  fontSize: 1.w * 0.05, fontWeight: FontWeight.normal)),
          Text('price',
              style: TextStyle(
                  fontSize: 1.w * 0.05, fontWeight: FontWeight.normal))
        ],
      ),
    );
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
                  'Payment Method',
                  style: TextStyle(
                      fontSize: 1.w * 0.08, fontWeight: FontWeight.bold),
                ),
                Text(
                  '2 methods',
                  style: TextStyle(
                      fontSize: 1.w * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          Container(
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
            height: 1.h * 0.35,
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: 1.h * 0.3,
                  width: double.maxFinite,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    controller: pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return items(
                        index: index,
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: WormEffect(),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.8),
                  width: 1.9,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listTransactions.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    listTransactions[index],
                  ],
                );
              }),
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
                    Text('sub total',
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
                    Text('total',
                        style: TextStyle(
                            fontSize: 1.w * 0.05, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
