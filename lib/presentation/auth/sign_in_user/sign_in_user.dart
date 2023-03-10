import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';
import '../sign_up/sign_up.dart';
import '../sing_in_merchant/sign_in_merchant_screen.dart';
import 'signin_background.dart';

class SignInUserScreen extends StatelessWidget {
  SignInUserScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SignInBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGIN USER',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.05.w,
                      color: Colors.black)),
              SizedBox(height: 0.05.h),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: 0.4.h,
              ),
              SizedBox(height: 0.07.h),
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
                    controller: controller.phoneNumber,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        icon: Icon(Icons.person, color: kPrimaryColor),
                        border: InputBorder.none),
                    // onChanged: (value) => _email = value,
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
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                        ),
                        border: InputBorder.none),
                    // onChanged: (values) {
                    //   _password = values;
                    // }
                  )),
              SizedBox(height: 0.02.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: 0.8.w,
                  color: kPrimaryColor,
                  onPressed: () {
                    controller.onSignIn(false);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 0.01.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUpPage());
                },
                child: Text(
                  'Dont have an account? Let Sign Up!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 0.01.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignInMerchantScreen());
                },
                child: Text(
                  'Or login as merchant',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
