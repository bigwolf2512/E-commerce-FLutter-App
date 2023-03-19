import 'package:flutter/material.dart';

import '../../design/extension/double_extension.dart';
import '../constant/constant.dart';

class ButtonFlat extends StatelessWidget {
  final Color color;
  final double padding;
  final int itemsNumber;
  final Icon icon;
  final Function()? onTap;
  const ButtonFlat({
    Key? key,
    required this.itemsNumber,
    required this.padding,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(children: [
        Container(
            padding: EdgeInsets.all(padding),
            height: 0.13.w,
            width: 0.13.w,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: icon),
        itemsNumber == 0
            ? Container()
            : Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 0.06.w,
                  width: 0.06.w,
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
      ]),
    );
  }
}
