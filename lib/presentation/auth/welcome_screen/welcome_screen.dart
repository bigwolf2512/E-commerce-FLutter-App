import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../route/route_helper.dart';
import '../../../share/constant/constant.dart';
import '../components/mainBackground.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return mainBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'WELCOME TO EMMERCESHOP!',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                color: Colors.black),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SvgPicture.asset("assets/icons/chat.svg", height: size.height * 0.4),
          SizedBox(height: size.height * 0.05),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: size.width * 0.8,
              color: kPrimaryColor,
              onPressed: () {
                RouteHelper.getSignIn(context);
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: size.width * 0.8,
              color: kPrimaryColor.withOpacity(0.5),
              onPressed: () {
                RouteHelper.getSignUp(context);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              minWidth: size.width * 0.8,
              color: Colors.deepOrange,
              onPressed: () {
                RouteHelper.getUserMainPage(context);
              },
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
