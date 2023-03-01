import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../data/controller/popular_product_controller.dart';
import '../../../../data/controller/recommended_product_controller.dart';
import '../../../../share/constant/constant.dart';
import '../../../../share/widget/alert_dialog.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  bool isChecked = false;
  bool isPush = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder(
      builder: (cartController) {
        return false
            ? SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/images/empty-cart.png',
                ))
            : SingleChildScrollView(
                child: SizedBox(
                  height: size.height * 0.7,
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 0,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: size.height * 0.16,
                          width: double.maxFinite,
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
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
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
                                              'name',
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
                                                  TextSpan(children: [
                                                    TextSpan(
                                                      text: '',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.022,
                                                          color: kAccentColor),
                                                    ),
                                                    TextSpan(
                                                      text: ' items',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.02,
                                                          color: kTextColor),
                                                    )
                                                  ]),
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
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  value: false,
                                                  onChanged: (bool? value) {},
                                                ),
                                                Text(
                                                  'Select',
                                                  style: TextStyle(
                                                      color: Colors.deepOrange,
                                                      fontSize:
                                                          size.height * 0.02),
                                                )
                                              ],
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(3),
                                              height: size.height * 0.05,
                                              width: size.width * 0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.deepOrange
                                                    .withOpacity(0.9),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: !isPush
                                                        ? Icon(Icons.remove,
                                                            color: Colors.white)
                                                        : Icon(Icons.remove,
                                                            color: Colors
                                                                .transparent),
                                                  ),
                                                  Text(
                                                    '',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: size.height *
                                                            0.022),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(Icons.add,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
      },
    );
  }
}
