import 'package:ecommerceshop/route_helper/route_helper.dart';
import 'package:flutter/material.dart';
import '../../../app_const/app_const.dart';

AppBar appBar(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    shadowColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => RouteHelper().getPersonalPage(context),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: size.height * 0.05,
            width: size.height * 0.05,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(admin), fit: BoxFit.cover)),
          ),
        ),
        Text(
          "Your Orders",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    backgroundColor: Theme.of(context).bottomAppBarColor,
  );
}
