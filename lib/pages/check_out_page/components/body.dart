import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/controller/cart_controller.dart';
import 'items.dart';

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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: widget.size.height * 0.1,
              width: double.maxFinite,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check Out',
                    style: TextStyle(
                        fontSize: widget.size.width * 0.08,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${cartController.getCheckOutLenght}  items',
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
              height: widget.size.height * 0.5,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Get.find<CartController>().getCheckOutLenght,
                itemBuilder: (BuildContext context, int index) {
                  return items(
                    size: widget.size,
                    index: index,
                    cartController: cartController,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                          '\$ ${Get.find<CartController>().selectedPrice * 0.05}',
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
                          '\$ ${Get.find<CartController>().selectedPrice * 1.05}',
                          style: TextStyle(
                              fontSize: widget.size.width * 0.05,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
