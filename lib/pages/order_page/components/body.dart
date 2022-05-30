import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_const/app_const.dart';

class body extends StatelessWidget {
  final CartController cartController;
  const body(
    find, {
    Key? key,
    required this.cartController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = 0;
    Size size = MediaQuery.of(context).size;
    if (Get.find<CartController>().orderItems.isEmpty) {
      return Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Image.asset(
            'assets/images/order.jpg',
          ));
    } else {
      return SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Get.find<CartController>().orderItems.length,
          itemBuilder: (BuildContext context, index) {
            length = Get.find<CartController>().orderItems.length - 1;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Order ID: ${1}",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Payment: By Cash",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Will be delivered to you on ${"October 3"}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Status: Delivering to ${"Thuong Hai, Trung Quoc"}",
                      style: TextStyle(fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          Get.find<CartController>().orderItems[length]?.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 10, left: 10),
                          height: size.height * 0.14,
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.14,
                                width: size.height * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(''),
                                        fit: BoxFit.cover),
                                    color: kSecondaryColor),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${1}',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: size.height * 0.022,
                                              ),
                                            ),
                                            SizedBox(
                                                height: size.height * 0.01),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '\$',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.022,
                                                            color:
                                                                kAccentColor),
                                                      ),
                                                      TextSpan(
                                                        text: ' name',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.02,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.025,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Total Cash: \$ ${120}",
                      style: TextStyle(fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
