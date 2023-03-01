import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final phoneNumber = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  onSignIn() {
    if (phoneNumber.text.isEmpty || password.text.isEmpty) return;
  }

  onSignUp() {
    if (phoneNumber.text.isEmpty ||
        fullName.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) return;
  }
}
