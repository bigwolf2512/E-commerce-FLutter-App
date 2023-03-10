import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../design/extension/double_extension.dart';
import '../../../user/user_detail/user_detail_screen.dart';

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
              height: 0.05.h,
              width: 0.05.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(''), fit: BoxFit.cover)),
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
