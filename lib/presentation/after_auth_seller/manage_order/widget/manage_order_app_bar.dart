import 'package:ecommerceshop/presentation/feature_shared/user_detail/user_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../design/extension/double_extension.dart';
import '../../../../helper/navigator_helper.dart';

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
            onTap: () => Push.to(context, PersonalPage()),
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
