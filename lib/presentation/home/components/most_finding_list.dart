import 'dart:math';

import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';

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
          height: 1.h * 0.2,
          width: 1.w * 0.6,
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
