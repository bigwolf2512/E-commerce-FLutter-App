import 'package:ecommerceshop/presentation/auth/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../share/constant/constant.dart';
import 'signin_background.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: SignInBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGIN',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                      color: Colors.black)),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.4,
              ),
              SizedBox(height: size.height * 0.07),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: size.width * 0.8,
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
                  width: size.width * 0.8,
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
              SizedBox(height: size.height * 0.02),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: size.width * 0.8,
                  color: kPrimaryColor,
                  onPressed: () {
                    controller.onSignIn();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  Get.to(SignUpPage());
                },
                child: Text(
                  'Dont have an account? Let Sign Up!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Or countinue at GUEST.',
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
