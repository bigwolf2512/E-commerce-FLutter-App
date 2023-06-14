import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/presentation/after_auth_buyer/order/order_screen.dart';
import 'package:ecommerceshop/presentation/after_auth_seller/manage_product/manage_product_screen.dart';
import 'package:ecommerceshop/presentation/feature_shared/user_detail/user_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../share/constant/constant.dart';
import '../../after_auth_buyer/cart/cart_screen.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<HomePage> {
  final List<Widget> _buildBuyerScreens = [
    DashboardPage(),
    CartHomePage(),
    OrderScreen(),
    PersonalPage(),
  ];

  final List<Widget> _buildSellerScreens = [
    DashboardPage(),
    ManageProductScreen(),
    OrderScreen(),
    PersonalPage(),
  ];

  final List<PersistentBottomNavBarItem> _navBuyerBarsItems = [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: ("Card"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.archivebox),
      title: ("Order"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: ("Personal"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];

  final List<PersistentBottomNavBarItem> _navSellerBarsItems = [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.production_quantity_limits),
      title: ("Product Manager"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.add_card),
      title: ("Order Manager"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: ("Personal"),
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];

  final PersistentTabController _controller = PersistentTabController();

  final prefRepo = Get.find<PrefRepo>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: prefRepo.isCurrentSeller()
              ? _buildSellerScreens
              : _buildBuyerScreens,
          items: prefRepo.isCurrentSeller()
              ? _navSellerBarsItems
              : _navBuyerBarsItems,
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}
