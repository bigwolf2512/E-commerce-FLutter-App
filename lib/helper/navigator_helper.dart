import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Push {
  static to(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (c) => page));
  }

  static noBottomBar(BuildContext context, Widget page) {
    return PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: page,
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}
