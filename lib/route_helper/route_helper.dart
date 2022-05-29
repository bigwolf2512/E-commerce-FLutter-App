import 'package:ecommerceshop/pages/check_out_page/check_out_page.dart';
import 'package:ecommerceshop/pages/items_page_view/items_page_view.dart';
import 'package:ecommerceshop/pages/main_page/main_food_page.dart';
import 'package:ecommerceshop/pages/payment_page/payment_page.dart';
import 'package:ecommerceshop/pages/personal_page/personal_page.dart';
import 'package:ecommerceshop/pages/welcome_pages/sign_in/sign_in.dart';
import 'package:ecommerceshop/pages/welcome_pages/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/cart_controller.dart';
import '../pages/cart_page/carts_page.dart';

class RouteHelper {
  Future getPersonalPage(BuildContext context) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => PersonalPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getItemsPageView(BuildContext context, int productID) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => ItemsPageView(
          productId: productID,
        ),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getCartPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => CartPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getMainPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => MainFoodPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getSignIn(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => SignInPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getCheckOut(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => CheckOutPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getSignUp(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => SignUpPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getPaymentPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => PaymentPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getBack(BuildContext context) {
    Navigator.pop(context);
  }
}
