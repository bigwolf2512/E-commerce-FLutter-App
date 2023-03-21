import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/navigator_helper.dart';
import '../../../share/constant/constant.dart';
import '../log_in_buyer/log_in_buyer_page.dart';
import 'signup_background.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SignUpBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SIGN UP',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.05.w,
                      color: Colors.black)),
              SvgPicture.asset("assets/icons/signup.svg", width: 0.8.w),
              SizedBox(height: 0.01.h),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 0.8.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                  ),
                  child: TextField(
                    controller: controller.fullName,
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        icon: Icon(Icons.person, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 0.8.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                  ),
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.mail, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 0.8.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                  ),
                  child: TextField(
                    controller: controller.phoneNumber,
                    decoration: InputDecoration(
                        hintText: "Phone number",
                        icon: Icon(Icons.phone, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 0.8.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: controller.password,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              SizedBox(height: 0.01.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: 0.8.w,
                  color: kPrimaryColor,
                  onPressed: () async {
                    await controller.onSignUpUser(false, context);
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: 0.8.w,
                  color: kActiveColor,
                  onPressed: () async {
                    await controller.onSignUpUser(true, context);
                  },
                  child: const Text(
                    "Sign Up As Merchant",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 0.01.h),
              GestureDetector(
                onTap: () {
                  Push.to(context, SignInUserScreen());
                },
                child: Text(
                  'Already have an account? Let Sign In!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
