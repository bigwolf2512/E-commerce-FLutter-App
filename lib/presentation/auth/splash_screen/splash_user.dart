import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../share/constant/constant.dart';
import '../../user/main_page/main_food_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

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
        navigateAfterSeconds: UserMainFoodPage(),
        onClick: () => UserMainFoodPage());
  }
}
