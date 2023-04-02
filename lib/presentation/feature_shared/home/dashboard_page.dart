import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_spref.dart';
import '../../../data/controller/cart_controller.dart';
import '../../../data/controller/notification_controller.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/navigator_helper.dart';
import '../../../share/constant/constant.dart';
import '../../../share/widget/widget_button_flat.dart';
import '../../../share/widget/widget_loading_indicator.dart';
import '../../../share/widget/widget_snack_bar_helper.dart';
import '../../after_auth_buyer/cart/cart_screen.dart';
import '../notification/notification_page.dart';
import 'components/list_store_widget.dart';
import 'components/title_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final PrefRepo repo;

  @override
  void initState() {
    super.initState();

    repo = Get.find<PrefRepo>();

    // WidgetsBinding.instance.addPostFrameCallback(
    //     (timeStamp) => SnackBarHelper.showSnackBar(context));
  }

  @override
  Widget build(BuildContext context) {
    if (repo.sharedPreferences.containsKey(kPathPrefUser)) {
      if (repo.isCurrentSeller()) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildDiscount(),
              TitleWidget(title: 'Your products on sale'),
              OwnStoreWidget(),
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              InkWell(
                  onTap: () {
                    SnackBarHelper.showSnackBar(context);
                  },
                  child: _buildDiscount()),
              ListStoreWidget(),
            ],
          ),
        );
      }
    }
    return OnLoadingIndicator();
  }

  Widget _buildDiscount() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 0.15.h,
      width: 0.95.w,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: const [
            TextSpan(
              text: "A Summer Surpise\n",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
                  color: kSecondaryColor,
                  itemsNumber: 0,
                  padding: 0.025.w,
                  icon: Icon(CupertinoIcons.chat_bubble_2),
                ),
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
                      Push.noBottomBar(context, NotificationPage());
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
