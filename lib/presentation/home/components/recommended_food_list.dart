import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRecommendedFood extends StatelessWidget {
  final int productID;

  const ListRecommendedFood({
    Key? key,
    required this.size,
    required this.productID,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        height: size.height * 0.2,
        width: size.width * 0.5,
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
