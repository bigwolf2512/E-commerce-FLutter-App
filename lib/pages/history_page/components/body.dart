import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';

import '../../../app_const/app_const.dart';

class body extends StatelessWidget {
  final CartController cartController;
  const body(
    find, {
    Key? key,
    required this.cartController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("This prodcut is going deliver to you on ${"May 18"}."),
              Container(
                margin: const EdgeInsets.all(10),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${1}',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: size.height * 0.022,
                                          ),
                                        ),
                                        SizedBox(height: size.height * 0.01),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text.rich(
                                              TextSpan(children: [
                                                TextSpan(
                                                    text: '\$',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.022,
                                                        color: kAccentColor)),
                                                TextSpan(
                                                    text: ' name',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.02,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
