// ignore_for_file: deprecated_member_use

import 'package:ecommerceshop/data/controller/auth_controller.dart';
import 'package:ecommerceshop/pages/welcome_pages/sign_up/signupBackground.dart';
import 'package:ecommerceshop/route_helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app_const/app_const.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _name = TextEditingController();
    final _email = TextEditingController();
    final _phonenumber = TextEditingController();
    final _password = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: signupBackground(
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
                    controller: _name,
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
                    controller: _email,
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
                    controller: _phonenumber,
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
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        border: InputBorder.none),
                  )),
              SizedBox(height: size.height * 0.01),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  minWidth: size.width * 0.8,
                  color: kPrimaryColor,
                  onPressed: () {
                    Get.find<AuthController>().RegisterPress(
                        context,
                        _name.text,
                        _email.text,
                        _phonenumber.text,
                        _password.text);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  RouteHelper.getSignIn(context);
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
