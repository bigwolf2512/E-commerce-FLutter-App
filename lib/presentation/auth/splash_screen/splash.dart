import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../share/constant/constant.dart';
import '../../home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        title: const Text(
          "WELCOME TO EMMERCESHOP",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        loaderColor: Colors.white,
        navigateAfterSeconds: HomePage(),
        onClick: () => HomePage());
  }
}
