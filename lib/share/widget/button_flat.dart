import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/constant.dart';

class ButtonFlat extends StatelessWidget {
  final Color color;
  final double padding;
  final int itemsNumber;
  final String images;
  const ButtonFlat({
    Key? key,
    required this.images,
    required this.itemsNumber,
    required this.padding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 2;
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
          padding: EdgeInsets.all(padding),
          height: size.width * 0.13,
          width: size.width * 0.13,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            images,
            color: kTextColor,
          )),
      itemsNumber == 0
          ? Container()
          : Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: size.width * 0.06,
                width: size.width * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: Center(
                    child: Text(
                  '$itemsNumber',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
    ]);
  }
}
