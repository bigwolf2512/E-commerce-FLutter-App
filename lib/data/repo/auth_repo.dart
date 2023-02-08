import 'dart:convert';

import '../controller/auth_controller.dart';
import '../model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.sharedPreferences});
  String _user = '';
  String getUserString = '';
  String getToken = '';
  var _userProfile;
  Future<void> setUserModel(User user) async {
    _user = '';
    _user = jsonEncode(user);
    sharedPreferences.setString("USER-PROFILE", _user);
    sharedPreferences.setString("TOKEN", user.token!);
    Get.find<AuthController>().setTOKEN();
    getUserModel();
  }

  getUserModel() {
    if (sharedPreferences.containsKey("USER-PROFILE")) {
      getUserString = sharedPreferences.getString("USER-PROFILE")!;
      _userProfile = User.fromJson(jsonDecode(getUserString));
    } else {
      getUserString = jsonEncode(User(
          id: 0,
          name: 'You are not logged in',
          phoneNumber: 'You are not logged in',
          email: 'You are not logged in',
          createdAt: 'You are not logged in'));
      _userProfile = User.fromJson(jsonDecode(getUserString));
    }
    return _userProfile;
  }

  getTOKEN() {
    if (sharedPreferences.containsKey("TOKEN")) {
      getToken = sharedPreferences.getString("TOKEN")!;
    }
    return getToken;
  }
}
