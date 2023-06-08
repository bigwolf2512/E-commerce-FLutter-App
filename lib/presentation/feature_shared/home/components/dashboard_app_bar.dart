import 'package:ecommerceshop/data/controller/chat_controller.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../data/controller/notification_controller.dart';
import '../../../../helper/navigator_helper.dart';
import '../../../../share/constant/constant.dart';
import '../../../../share/widget/widget_button_flat.dart';
import '../../../after_auth_buyer/cart/cart_screen.dart';
import '../../notification/notification_page.dart';

class DashBoardAppBar extends StatefulWidget {
  const DashBoardAppBar({Key? key}) : super(key: key);

  @override
  State<DashBoardAppBar> createState() => _DashBoardAppBarState();
}

class _DashBoardAppBarState extends State<DashBoardAppBar> {
  final PrefRepo repo = Get.find();

  @override
  Widget build(BuildContext context) {
    return repo.isCurrentSeller() ? _BuildSellerAppBar() : _BuildBuyerAppBar();
  }
}

class _BuildBuyerAppBar extends StatelessWidget {
  const _BuildBuyerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              width: 0.4.w,
              height: 0.13.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kSecondaryColor,
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Search for products",
                    icon: Image.asset(
                      "assets/icons/find.png",
                      fit: BoxFit.fill,
                      height: 0.05.w,
                    ),
                    border: InputBorder.none),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GetBuilder<ChatController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.noBottomBar(context, ChatScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.chatTotal,
                    padding: 0.025.w,
                    icon: Icon(CupertinoIcons.chat_bubble_2),
                  );
                }),
                SizedBox(width: 0.03.w),
                GetBuilder<CartController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.noBottomBar(context, CartHomePage());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalProductsInCart,
                    padding: 0.025.w,
                    icon: Icon(CupertinoIcons.shopping_cart),
                  );
                }),
                SizedBox(width: 0.03.w),
                GetBuilder<NotificationController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.noBottomBar(context, NotificationScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalNotifications,
                    padding: 0.025.w,
                    icon: Icon(CupertinoIcons.bell),
                  );
                }),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildSellerAppBar extends StatelessWidget {
  const _BuildSellerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              width: 0.4.w,
              height: 0.13.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kSecondaryColor,
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Search for products",
                    icon: Image.asset(
                      "assets/icons/find.png",
                      fit: BoxFit.fill,
                      height: 0.05.w,
                    ),
                    border: InputBorder.none),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ButtonFlat(
                  onTap: () {
                    Push.noBottomBar(context, ChatScreen());
                  },
                  color: kSecondaryColor,
                  itemsNumber: 0,
                  padding: 0.025.w,
                  icon: Icon(CupertinoIcons.chat_bubble_2),
                ),
                SizedBox(width: 0.03.w),
                ButtonFlat(
                  onTap: () {},
                  color: kSecondaryColor,
                  itemsNumber: 0,
                  padding: 0.025.w,
                  icon: Icon(CupertinoIcons.profile_circled),
                ),
                SizedBox(width: 0.03.w),
                GetBuilder<NotificationController>(builder: (controller) {
                  return ButtonFlat(
                    onTap: () {
                      Push.noBottomBar(context, NotificationScreen());
                    },
                    color: kSecondaryColor,
                    itemsNumber: controller.getTotalNotifications,
                    padding: 0.025.w,
                    icon: Icon(CupertinoIcons.bell),
                  );
                }),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
