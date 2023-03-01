import 'package:flutter/material.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../share/constant/constant.dart';

class items extends StatelessWidget {
  final int index;
  const items({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: size.height * 0.14,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: size.height * 0.14,
              width: size.height * 0.14,
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
                              fontSize: size.height * 0.022,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'price',
                                      style: TextStyle(
                                          fontSize: size.height * 0.022,
                                          color: kAccentColor)),
                                  TextSpan(
                                      text: ' name',
                                      style: TextStyle(
                                          fontSize: size.height * 0.02,
                                          color: kTextColor))
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
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
