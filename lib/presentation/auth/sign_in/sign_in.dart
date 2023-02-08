import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../route/route_helper.dart';
import '../../../share/constant/constant.dart';
import 'signinBackground.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final String _password = '';
  final String _email = '';
  bool obscure_text = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _password = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: signinBackground(
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
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
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
                    controller: _passwordController,
                    obscureText: obscure_text,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock, color: kPrimaryColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure_text = !obscure_text;
                            });
                          },
                          icon: Icon(
                            obscure_text
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                    Get.find<AuthController>().LoginPress(context,
                        _emailController.text, _passwordController.text);
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
                  RouteHelper.getSignUp(context);
                },
                child: Text(
                  'Dont have an account? Let Sign Up!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  RouteHelper.getMerchantMainPage(context);
                },
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
