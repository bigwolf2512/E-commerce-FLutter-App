import 'dart:async';

import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';

class ConfirmOrderBottom extends StatelessWidget {
  const ConfirmOrderBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(),
        height: 1.h * 0.07,
        width: 1.w * 0.55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.black),
        child: Align(
          alignment: Alignment.center,
          child: Text.rich(
            TextSpan(
              children: const [
                TextSpan(
                  text: 'Buy Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
