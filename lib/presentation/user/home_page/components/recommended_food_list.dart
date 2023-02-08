import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/popular_product_controller.dart';
import '../../../../data/controller/recommended_product_controller.dart';
import '../../../../route/route_helper.dart';

class ListRecommendedFood extends StatelessWidget {
  final int productID;
  final RecommendedProductController recommendedController;

  const ListRecommendedFood({
    Key? key,
    required this.size,
    required this.productID,
    required this.recommendedController,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var img;
    for (var value in recommendedController.recommendedproductList) {
      if (value.id == productID) {
        img = value.image;
      }
    }
    return GetBuilder<PopularProductController>(
      builder: (popularController) {
        return GestureDetector(
          onTap: () {
            popularController.initQuantity();
            RouteHelper.getItemsPageView(context, productID);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15),
            height: size.height * 0.2,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  .withOpacity(0.3),
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
