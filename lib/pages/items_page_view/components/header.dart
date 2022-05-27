import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app_const/app_const.dart';
import '../../../components/button_flat.dart';

class ItemsPageView_Header extends StatelessWidget {
  final String rating;
  const ItemsPageView_Header({
    Key? key,
    required this.size,
    required this.rating,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const ButtonFlat(
                    color: kSecondaryColor,
                    itemsNumber: 0,
                    images: 'assets/icons/Back ICon.svg',
                    padding: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: size.width * 0.13,
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: rating,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBodyTextColor)),
                      ])),
                      SvgPicture.asset('assets/icons/Star Icon.svg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
