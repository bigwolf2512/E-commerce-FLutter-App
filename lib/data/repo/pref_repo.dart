import 'dart:convert';

import 'package:ecommerceshop/data/model/buyer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/path_spref.dart';
import '../model/user_model.dart';

class PrefRepo {
  final SharedPreferences sharedPreferences;

  PrefRepo(this.sharedPreferences);

  setCurrentBuyer(BuyerModel buyer) async {
    await sharedPreferences.setString(
        kPathPrefUser, jsonEncode(UserModel(buyerModel: buyer)));
  }

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

  getCurrentUserId() {
    if (isCurrentSeller()) {
      return getCurrentUser().sellerModel?.id;
    }
    return getCurrentUser().buyerModel?.id;
  }
}
