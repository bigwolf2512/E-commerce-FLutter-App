import 'package:flutter/material.dart';

import '../../../../design/extension/double_extension.dart';
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
        height: 0.14.h,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 0.14.h,
              width: 0.14.h,
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
                              fontSize: 0.022.h,
                            ),
                          ),
                          SizedBox(height: 0.01.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'price',
                                      style: TextStyle(
                                          fontSize: 0.022.h,
                                          color: kAccentColor)),
                                  TextSpan(
                                      text: ' name',
                                      style: TextStyle(
                                          fontSize: 0.02.h, color: kTextColor))
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.025.h,
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
