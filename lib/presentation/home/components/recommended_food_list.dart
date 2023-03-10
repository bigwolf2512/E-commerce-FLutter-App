import 'dart:math';

import 'package:flutter/material.dart';

import '../../../design/extension/double_extension.dart';

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
        height: 0.2.h,
        width: 0.5.w,
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
