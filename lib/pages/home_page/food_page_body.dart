// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerceshop/app_const/app_const.dart';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/data/controller/recommended_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/button_flat.dart';
import '../../data/controller/cart_controller.dart';
import '../../route_helper/route_helper.dart';
import 'components/events_list.dart';
import 'components/most_finding_list.dart';
import 'components/popular_food_list.dart';
import 'components/recommended_food_list.dart';

class FoodPageBody extends StatelessWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<PopularProductController>().getpopularproductList();
    Get.find<RecommendedProductController>().getrecommendedproductList();
    return GetBuilder<CartController>(
      builder: (cartController) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    width: size.width * 0.52,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor,
                    ),
                    child: GetBuilder<PopularProductController>(
                      builder: (popularController) {
                        return TextField(
                          decoration: InputDecoration(
                              hintText: "Search for products",
                              icon: Image.asset(
                                "assets/icons/find.png",
                                fit: BoxFit.fill,
                                height: size.width * 0.05,
                              ),
                              border: InputBorder.none),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        GetBuilder<PopularProductController>(
                          builder: (popularController) {
                            return GestureDetector(
                              onTap: () {
                                RouteHelper.getCartPage(context);
                                cartController.setSelectedAll(false);
                              },
                              child: ButtonFlat(
                                color: kSecondaryColor,
                                images: "assets/icons/Cart Icon.svg",
                                itemsNumber: cartController.lengthCart,
                                padding: size.width * 0.025,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: size.width * 0.03),
                        ButtonFlat(
                          color: kSecondaryColor,
                          images: "assets/icons/Bell.svg",
                          itemsNumber: 12,
                          padding: size.width * 0.025,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: size.height * 0.15,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Color(0xFF4A3298),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "A Summer Surpise\n",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: "Cashback 20%",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: size.height * 0.12,
                width: size.width,
                padding: const EdgeInsets.only(right: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListEventObject(
                      pageID: index,
                    );
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Popular Food",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "See more",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: kBodyTextColor.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<PopularProductController>(
                builder: (popularController) {
                  return Container(
                    height: size.height * 0.2,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularController.popularproductList.length,
                      itemBuilder: (BuildContext context, index) {
                        var productID =
                            popularController.popularproductList[index].id;
                        return ListPopularFood(
                            size: size,
                            productID: productID!,
                            popularController: popularController);
                      },
                    ),
                  );
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Recommended Food",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "See more",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: kBodyTextColor.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<RecommendedProductController>(
                builder: (recommendedController) {
                  return Container(
                    height: size.height * 0.2,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          recommendedController.recommendedproductList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var productID = recommendedController
                            .recommendedproductList[index].id;
                        return ListRecommendedFood(
                          size: size,
                          productID: productID,
                          recommendedController: recommendedController,
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Most Finding For You",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "See more",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: kBodyTextColor.withOpacity(0.5))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.2,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListMostFinding(
                      size: size,
                      pageID: index,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
