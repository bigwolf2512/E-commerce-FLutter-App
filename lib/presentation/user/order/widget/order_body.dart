import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../share/constant/constant.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (false) {
      return Container(
          color: Colors.white,
          height: 1.h,
          width: 1.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/order.jpg',
              ),
            ],
          ));
    } else {
      return SizedBox(
        height: 1.h,
        width: 1.w,
        child: ListView(shrinkWrap: true, children: [
          for (int i = 0; i < 1; i++)
            Container(
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
                      children: [
                        Text(
                          "Order ID: ${i + 1}",
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
                  Column(
                    children: List.generate(
                      0,
                      (index) => Container(
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 1.h * 0.15,
                            child: Row(
                              children: [
                                Container(
                                  height: 1.h * 0.14,
                                  width: 1.h * 0.14,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(""),
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
                                          margin:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'name',
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(height: 1.h * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Price: \$ ',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        TextSpan(
                                                          text: 'price',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 1.h * 0.01),
                                              Text("Quantity: 0"),
                                              SizedBox(height: 1.h * 0.01),
                                              Text("Seller Id: 0"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h * 0.025,
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
                          )),
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
            )
        ]),
      );
    }
  }
}
