import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../share/constant/constant.dart';
import '../../../../share/widget/widget_button_flat.dart';
import 'widget/description_page_view.dart';

class ItemsPageView extends StatefulWidget {
  final int productId;

  const ItemsPageView({
    Key? key,
    required this.productId,
  }) : super(key: key);
  @override
  State<ItemsPageView> createState() => _ItemsPageViewState();
}

class _ItemsPageViewState extends State<ItemsPageView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      body: SizedBox(
        height: size.height * 1,
        width: double.maxFinite,
        child: Stack(
          children: [
            //top: 0, height: 0.3
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: size.height * 0.3,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(''),
                        fit: BoxFit.cover,
                      ),
                      color: kSecondaryColor),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ButtonFlat(
                            itemsNumber: 0,
                            padding: 16,
                            color: Colors.white,
                            icon: Icon(CupertinoIcons.back),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: size.width * 0.13,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text.rich(TextSpan(children: const [
                                  TextSpan(
                                      text: '4.5',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor)),
                                ])),
                                SvgPicture.asset('assets/icons/Star Icon.svg'),
                              ],
                            ))
                      ],
                    ),
                  )),
            ),
            //top: 0.28, height: 0.3
            Positioned(
              top: size.height * 0.28,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                width: double.maxFinite,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(text: '', style: const TextStyle(fontSize: 20)),
                    ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Container(
                            height: size.height * 0.06,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Colors.red[100]),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/Heart Icon_2.svg',
                                color: Colors.redAccent,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      height: size.height * 0.45,
                      padding: const EdgeInsets.only(right: 20),
                      child: DesciptionPageView(text: ''),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.75,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                height: size.height * 0.15,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: kSecondaryColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: size.height * 0.06,
                        width: size.width * 0.55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      fontSize: 20, color: kAccentColor)),
                              TextSpan(
                                  text: 0.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: kAccentColor)),
                              TextSpan(
                                  text: ' for ',
                                  style: TextStyle(
                                      fontSize: 16, color: kTextColor)),
                              TextSpan(
                                  text: 0.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: kAccentColor)),
                              TextSpan(
                                  text: ' items',
                                  style: TextStyle(
                                      fontSize: 16, color: kTextColor))
                            ]),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.06,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Center(
                                child: Icon(
                                  Icons.remove,
                                  color: kAccentColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: kAccentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height * 0.15,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.3),
                    )
                  ],
                ),
                child: Container(
                  height: size.height * 0.1,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -15),
                        blurRadius: 20,
                        color: Color(0xFFDADADA).withOpacity(0.3),
                      )
                    ],
                  ),
                  // ignore: deprecated_member_use
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(right: 12),
                          height: size.height * 0.09,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kPrimaryColor),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: true
                                        ? 'Add To Cart'
                                        : '${0} | Add More',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.09,
                        width: size.width * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kPrimaryColor),
                        child: GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: size.width * 0.001),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Check Out',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_sharp,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
