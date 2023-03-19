import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/path_spref.dart';
import '../model/user_model.dart';

class PrefRepo {
  final SharedPreferences sharedPreferences;

  PrefRepo(this.sharedPreferences);

  UserModel getCurrentUser() {
    UserModel userModel = UserModel();

    if (sharedPreferences.containsKey(kPathPrefUser)) {
      userModel = UserModel.fromJson(
          jsonDecode(sharedPreferences.getString(kPathPrefUser)!));
    }

    return userModel;
  }

  bool isCurrentSeller() {
    UserModel userModel = UserModel();

    if (sharedPreferences.containsKey(kPathPrefUser)) {
      userModel = UserModel.fromJson(
          jsonDecode(sharedPreferences.getString(kPathPrefUser)!));
    }

    if (userModel.buyerModel != null) return false;
    return true;
  }
}
