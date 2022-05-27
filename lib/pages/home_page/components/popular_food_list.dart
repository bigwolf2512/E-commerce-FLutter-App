import 'dart:math';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';

import '../../../route_helper/route_helper.dart';

class ListPopularFood extends StatelessWidget {
  final int productID;
  final PopularProductController popularController;
  const ListPopularFood({
    Key? key,
    required this.size,
    required this.productID,
    required this.popularController,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var img;
    for (int i = 0; i < popularController.popularproductList.length; i++) {
      if (popularController.popularproductList[i].id == productID) {
        img = popularController.popularproductList[i].image;
      }
    }
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
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
