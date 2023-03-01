import 'package:ecommerceshop/presentation/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../share/constant/constant.dart';
import 'signup_background.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      fontSize: size.width * 0.05,
                      color: Colors.black)),
              SvgPicture.asset("assets/icons/signup.svg",
                  width: size.width * 0.8),
              SizedBox(height: size.height * 0.01),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                    color: kPrimaryLightColor,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        icon: Icon(Icons.person, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
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
                    decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(Icons.mail, color: kPrimaryColor),
                        border: InputBorder.none),
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
                    decoration: InputDecoration(
                        hintText: "Phone number",
                        icon: Icon(Icons.phone, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              SizedBox(height: size.height * 0.01),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: size.width * 0.8,
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  Get.to(SignInPage());
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
