import '../presentation/user/main_page/main_food_page.dart';
import 'package:flutter/material.dart';

import '../presentation/auth/sign_in/sign_in.dart';
import '../presentation/auth/sign_up/sign_up.dart';
import '../presentation/merchant/items_page_view/items_page_view.dart';
import '../presentation/merchant/main_page/main_food_page.dart';
import '../presentation/merchant/personal_page/personal_page.dart';
import '../presentation/user/cart_page/carts_page.dart';
import '../presentation/user/check_out_page/check_out_page.dart';
import '../presentation/user/payment_page/payment_page.dart';

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

  static getMerchantMainPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => MerchantMainFoodPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getUserMainPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => MerchantMainFoodPage(),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  static getHome(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => UserMainFoodPage(),
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
