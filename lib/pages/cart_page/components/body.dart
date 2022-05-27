// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/data/controller/recommended_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_const/app_const.dart';
import '../../../components/alert_dialog.dart';
import '../../../data/controller/cart_controller.dart';

import '../../../models/popular_product_model.dart';
import '../../../route_helper/route_helper.dart';

class CartPage_Body extends StatefulWidget {
  const CartPage_Body({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage_Body> createState() => _CartPage_BodyState();
}

class _CartPage_BodyState extends State<CartPage_Body> {
  bool isChecked = false;
  bool isPush = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<CartController>(
      builder: (cartController) {
        return cartController.items.isEmpty
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
                    scrollDirection: Axis.vertical,
                    itemCount: cartController.lengthCart,
                    itemBuilder: ((context, index) {
                      int productId = cartController.getCartItems[index].id!;

                      return GestureDetector(
                        onTap: () {
                          RouteHelper.getItemsPageView(context, productId);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 10, top: 15),
                          height: size.height * 0.14,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.14,
                                width: size.height * 0.14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(cartController
                                            .getCartItems[index].image
                                            .toString()),
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
                                              '${cartController.getCartItems[index].name}',
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
                                                        text:
                                                            '\$ ${int.parse(cartController.getCartItems[index].price.toString())} x ${int.parse(cartController.getCartItems[index].quantity.toString())}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.022,
                                                            color:
                                                                kAccentColor)),
                                                    TextSpan(
                                                        text: ' items',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.02,
                                                            color: kTextColor))
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
                                                  value: cartController
                                                          .getCartItems[index]
                                                          .isSelect ??
                                                      false,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      cartController
                                                          .setSelected(
                                                              value!, index);
                                                    });
                                                  },
                                                ),
                                                Text(
                                                  cartController
                                                          .getCartItems[index]
                                                          .isSelect!
                                                      ? 'Selected'
                                                      : 'Select',
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
                                                      onTap: () {
                                                        var product =
                                                            getProductModel(
                                                                productId);
                                                        cartController.addItems(
                                                            product, -1);

                                                        setState(() {
                                                          cartController
                                                                  .removeAble
                                                              ? confirmAlertCartPage(
                                                                  context,
                                                                  index)
                                                              : null;
                                                        });
                                                        cartController
                                                            .selectedPrice;
                                                      },
                                                      child: !isPush
                                                          ? Icon(Icons.remove,
                                                              color:
                                                                  Colors.white)
                                                          : Icon(Icons.remove,
                                                              color: Colors
                                                                  .transparent)),
                                                  GetBuilder<
                                                          PopularProductController>(
                                                      builder:
                                                          (popularController) {
                                                    return popularController
                                                                .checkRemove ==
                                                            false
                                                        ? Text(
                                                            cartController
                                                                .getCartItems[
                                                                    index]
                                                                .quantity
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    size.height *
                                                                        0.022),
                                                          )
                                                        : Text('null');
                                                  }),
                                                  GestureDetector(
                                                      onTap: () {
                                                        var product =
                                                            getProductModel(
                                                                productId);
                                                        Timer(
                                                            Duration(
                                                                milliseconds:
                                                                    500), () {
                                                          cartController
                                                              .addItems(
                                                                  product, 1);
                                                        });
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: Colors.white)),
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

  getProductModel(int productId) {
    var product;
    var popularList = Get.find<PopularProductController>().popularproductList;
    var recommendedList =
        Get.find<RecommendedProductController>().recommendedproductList;
    for (int i = 0; i < popularList.length; i++) {
      if (popularList[i].id == productId) {
        product = popularList[i];
      }
    }
    for (int i = 0; i < recommendedList.length; i++) {
      if (recommendedList[i].id == productId) {
        product = recommendedList[i];
      }
    }
    return product;
  }
}
