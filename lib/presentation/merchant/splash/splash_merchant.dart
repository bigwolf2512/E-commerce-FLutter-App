import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../share/constant/constant.dart';
import '../main_page/main_food_page.dart';

class MerchantSplashPage extends StatefulWidget {
  const MerchantSplashPage({Key? key}) : super(key: key);

  @override
  State<MerchantSplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<MerchantSplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        title: const Text(
          "WELCOME TO EMMERCESHOP -- Merchant",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        loaderColor: Colors.white,
        navigateAfterSeconds: MerchantMainFoodPage(),
        onClick: () => MerchantMainFoodPage());
  }
}
