import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:ecommerceshop/presentation/user/user_detail/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../share/constant/constant.dart';

class ManageOrderAppBar extends StatelessWidget {
  const ManageOrderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.to(PersonalPage()),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              height: 1.h * 0.05,
              width: 1.h * 0.05,
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
}
