import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../design/extension/double_extension.dart';
import '../../../helper/navigator_helper.dart';
import '../../../share/constant/constant.dart';
import '../sign_in_user/sign_in_user.dart';
import '../sign_up/sign_up.dart';
import '../sing_in_merchant/sign_in_merchant_screen.dart';
import '../widget/main_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME TO ECOMMERCE!',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 0.05.w,
                color: Colors.black),
          ),
          SizedBox(height: 0.05.h),
          SvgPicture.asset("assets/icons/chat.svg", height: 0.4.h),
          SizedBox(height: 0.05.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 0.8.w,
              color: kPrimaryColor,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => SignInUserScreen()));
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 0.01.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 0.8.w,
              color: kPrimaryColor.withOpacity(0.5),
              onPressed: () {
                Push.to(context, SignUpPage());
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 0.01.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: 0.8.w,
              color: Colors.deepOrange,
              onPressed: () {
                Push.to(context, SignInMerchantScreen());
              },
              child: const Text(
                "Login as merchant",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
