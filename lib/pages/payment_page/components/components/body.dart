import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../data/controller/cart_controller.dart';
import 'items.dart';
import 'package:dots_indicator/dots_indicator.dart';

class body extends StatefulWidget {
  const body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        final listTransactions = List<Row>.generate(
          6,
          (i) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name',
                  style: TextStyle(
                      fontSize: widget.size.width * 0.05,
                      fontWeight: FontWeight.normal)),
              Text('\$ ${Get.find<CartController>().selectedPrice}',
                  style: TextStyle(
                      fontSize: widget.size.width * 0.05,
                      fontWeight: FontWeight.normal))
            ],
          ),
        );
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: widget.size.height * 0.1,
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          fontSize: widget.size.width * 0.08,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2 methods',
                      style: TextStyle(
                          fontSize: widget.size.width * 0.04,
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
                height: widget.size.height * 0.35,
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: widget.size.height * 0.3,
                      width: double.maxFinite,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        controller: pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return items(
                            cartController: cartController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: widget.size.height * 0.17,
                width: double.maxFinite,
                child: ListView.builder(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: widget.size.height * 0.17,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub Total',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.05,
                                fontWeight: FontWeight.normal)),
                        Text('\$ ${Get.find<CartController>().selectedPrice}',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.05,
                                fontWeight: FontWeight.normal))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tax',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.05,
                                fontWeight: FontWeight.normal)),
                        Text(
                            '\$ ${Get.find<CartController>().selectedPrice * 0.01}',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.05,
                                fontWeight: FontWeight.normal))
                      ],
                    ),
                    SizedBox(
                      height: widget.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.08,
                                fontWeight: FontWeight.bold)),
                        Text(
                            '\$ ${Get.find<CartController>().selectedPrice * 0.99}',
                            style: TextStyle(
                                fontSize: widget.size.width * 0.05,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
