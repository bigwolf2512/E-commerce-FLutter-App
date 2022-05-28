import 'dart:async';
import 'dart:convert';
import 'package:ecommerceshop/data/controller/cart_controller.dart';

import 'package:ecommerceshop/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_const/app_const.dart';
import '../../route_helper/route_helper.dart';
import '../api/api_client.dart';
import 'package:http/http.dart' as http;
import '../repo/auth_repo.dart';

class AuthController extends GetxController {
  final SharedPreferences sharedPreferences;
  final AuthRepo authRepo;
  final ApiClient apiClient;
  final CartController cartController;
  AuthController(
      {required this.apiClient,
      required this.cartController,
      required this.authRepo,
      required this.sharedPreferences});

  User _userData = User();
  User get userData => _userData;
  String _TOKEN = '';
  String get TOKEN => _TOKEN;
  setTOKEN() {
    if (sharedPreferences.containsKey("TOKEN")) {
      _TOKEN = sharedPreferences.getString("TOKEN")!;
    }
    return _TOKEN;
  }

  Future LoginPress(BuildContext context, String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await apiClient.login(email, password);
      if (response.statusCode == 200) {
        RouteHelper.getMainPage(context);
        _userData = UserModel.fromJson(jsonDecode(response.body)).user!;
        cartController.getCarts(userData.id!);
        apiClient.updateUserHeader(userData.token!);

        authRepo.setUserModel(userData);
        Get.snackbar('Notification', 'Welcome Back, ${_userData.name}',
            backgroundColor: kPrimaryColor, colorText: Colors.white);
      } else {
        errorSnackBar(context, "Incorect email or password. Please try again.");
      }
    } else {
      errorSnackBar(context, "Please enter all required information.");
    }
  }

  Future RegisterPress(BuildContext context, String name, String email,
      String phonenumber, String password) async {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    http.Response response =
        await apiClient.register(name, email, phonenumber, password);
    bool isFilled = true;
    if (name.isEmpty ||
        phonenumber.isEmpty ||
        password.isEmpty ||
        email.isEmpty) {
      errorSnackBar(context, "Please enter all required information.");
      isFilled = false;
    }
    if (!emailValid && isFilled) {
      errorSnackBar(context, "Email not valids, please try again.");
    }
    if (!phonenumber.isPhoneNumber && isFilled) {
      errorSnackBar(context, "Phone Number not valid, please try again.");
    }
    if (password.length < 6 && isFilled) {
      errorSnackBar(
          context, "Password needs at least 6 characters, please try again.");
    }
    if (response.statusCode == 200) {
      Map responseMap = jsonDecode(response.body);
      Get.snackbar('Notification', 'Register Successfull, You Can Sign In.',
          colorText: Colors.white, backgroundColor: kPrimaryColor);
    }
  }

  var storageUser;
  getUserProfile() {
    if (sharedPreferences.containsKey("TOKEN")) {
      _TOKEN = sharedPreferences.getString("TOKEN")!;
    }
    print(TOKEN);
    setUserProfile = authRepo.getUserModel();
    return storageUser;
  }

  set setUserProfile(User user) {
    storageUser = user;
    _userData = storageUser;
    _TOKEN = _userData.token ?? '';
    update();
  }

  remove() {
    if (sharedPreferences.containsKey("USER-PROFILE")) {
      sharedPreferences.remove("USER-PROFILE");
      sharedPreferences.remove("TOKEN");
      _TOKEN = '';
      Get.find<CartController>().checkItemsLogout();
      Timer(Duration(seconds: 1), () {
        getUserProfile();
      });
      update();
    }
  }
}
