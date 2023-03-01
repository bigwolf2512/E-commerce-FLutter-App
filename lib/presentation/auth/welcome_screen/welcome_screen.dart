import 'package:ecommerceshop/design/extension/size_extension.dart';
import 'package:ecommerceshop/presentation/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../share/constant/constant.dart';
import '../widget/main_background.dart';
import '../sign_up/sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME TO EMMERCESHOP!',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 1.w * 0.05,
                color: Colors.black),
          ),
          SizedBox(
            height: 1.h * 0.05,
          ),
          SvgPicture.asset("assets/icons/chat.svg", height: 1.h * 0.4),
          SizedBox(height: 1.h * 0.05),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 1.w * 0.8,
              color: kPrimaryColor,
              onPressed: () {
                Get.to(SignInPage());
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 1.h * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 1.w * 0.8,
              color: kPrimaryColor.withOpacity(0.5),
              onPressed: () {
                Get.to(SignUpPage());
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 1.h * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 1.w * 0.8,
              color: Colors.deepOrange,
              onPressed: () {},
              child: const Text(
                "Continue as Guest",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
