import 'dart:io';

import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    this.image = '',
    this.height = 100,
    this.width = 100,
    this.child,
  }) : super(key: key);

  final String image;

  final double height;
  final double width;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: image.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )
              : DecorationImage(image: FileImage(File(''))),
          color: kSecondaryColor),
    );
  }
}
