import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../../data/constant/path_spref.dart';
import '../../../data/repo/auth_repo.dart';
import '../../../helper/size_helper.dart';
import '../../../share/constant/constant.dart';
import '../../home/home_screen.dart';
import '../welcome_screen/welcome_screen.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final AuthRepo authRepo = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SplashScreen(
        seconds: 2,
        title: const Text(
          "WELCOME TO EMMERCESHOP",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        imageBackground: AssetImage('assets/images/main_top.png'),
        loaderColor: Colors.white,
        navigateAfterSeconds:
            authRepo.sharedPreferences.containsKey(kPathPrefUserId)
                ? HomePage()
                : WelcomeScreen(),
        onClick: () => authRepo.sharedPreferences.containsKey(kPathPrefUserId)
            ? HomePage()
            : WelcomeScreen());
  }
}
