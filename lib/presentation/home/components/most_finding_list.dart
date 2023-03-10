import 'dart:math';

import 'package:flutter/material.dart';

import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';

class ListMostFinding extends StatelessWidget {
  const ListMostFinding({Key? key, required this.pageID}) : super(key: key);
  final int pageID;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          height: 0.2.h,
          width: 0.6.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage(
                    "assets/images/Image Banner 2.png",
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Healthy Food",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: kSecondaryColor)),
              ])),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "18 products",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          backgroundColor: kSecondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
