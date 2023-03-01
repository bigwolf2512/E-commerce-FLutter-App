import 'dart:math';

import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRecommendedFood extends StatelessWidget {
  const ListRecommendedFood({Key? key, required this.productID})
      : super(key: key);
  final int productID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        height: 1.h * 0.2,
        width: 1.w * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
              .withOpacity(0.3),
          image: DecorationImage(image: NetworkImage(''), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
