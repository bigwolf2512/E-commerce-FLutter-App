import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:flutter/material.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../share/constant/constant.dart';

class ConfirmOrderItemWidget extends StatelessWidget {
  final int index;
  const ConfirmOrderItemWidget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 1.h * 0.14,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 1.h * 0.14,
              width: 1.h * 0.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(''), fit: BoxFit.cover),
                  color: kSecondaryColor),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 1.h * 0.022,
                            ),
                          ),
                          SizedBox(height: 1.h * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'price',
                                      style: TextStyle(
                                          fontSize: 1.h * 0.022,
                                          color: kAccentColor)),
                                  TextSpan(
                                      text: ' name',
                                      style: TextStyle(
                                          fontSize: 1.h * 0.02,
                                          color: kTextColor))
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h * 0.025,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
