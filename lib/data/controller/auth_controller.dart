import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../presentation/auth/sign_in_user/sign_in_user.dart';
import '../../presentation/auth/sing_in_merchant/sign_in_merchant_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../constant/path_collection.dart';
import '../constant/path_spref.dart';
import '../model/merchant_user_model.dart';
import '../model/regular_user_model.dart';
import '../model/user_model.dart';
import '../repo/auth_repo.dart';

class AuthController extends GetxController {
  AuthController(this.authRepo, this.sharedPreferences);

  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final phoneNumber = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  onSignIn(bool isMerchant) async {
    if (phoneNumber.text.isEmpty || password.text.isEmpty) return;

    final CollectionReference response =
        firebaseFirestore.collection(kPathCollectionUser);

    var documentReference =
        response.where('phoneNumber', isEqualTo: phoneNumber.text);

    final result = await documentReference.get();

    if (isMerchant) {
      final merchantUser =
          MerchantUserModel.fromJson(result.docs.first.get('merchantUser'));

      if (merchantUser.password == password.text) {
        debugPrint('success merchantUser');

        if (!sharedPreferences.containsKey(kPathPrefUserId)) {
          sharedPreferences.setString(kPathPrefUserId, merchantUser.name ?? '');
        }

        Get.offAll(() => HomePage());
      }
    } else {
      final regularUser =
          RegularUserModel.fromJson(result.docs.first.get('regularUser'));

      if (regularUser.password == password.text) {
        debugPrint('success regularUser');

        if (!sharedPreferences.containsKey(kPathPrefUserId)) {
          sharedPreferences
            ..setString(kPathPrefUserId, regularUser.name ?? '')
            ..setBool(kPathPrefUserCheck, false);
        }

        Get.offAll(() => HomePage());
      }
    }
  }

  onSignUpUser(bool isMerchant) async {
    if (phoneNumber.text.isEmpty ||
        fullName.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) return null;

    final CollectionReference response =
        firebaseFirestore.collection(kPathCollectionUser);

    var documentReference =
        response.where('phoneNumber', isEqualTo: phoneNumber.text);

    final result = await documentReference.get();

    if (result.size != 0) return;

    if (isMerchant) {
      authRepo
          .create(UserModel(
              id: Get.find<Uuid>().v1(),
              isRegisterMerchant: isMerchant,
              phoneNumber: phoneNumber.text,
              merchantUser: MerchantUserModel(
                name: fullName.text,
                email: email.text,
                password: password.text,
              )).toJson())
          .whenComplete(() {
        Get.to(() => SignInMerchantScreen());
      });
    } else {
      authRepo
          .create(UserModel(
              id: Get.find<Uuid>().v1(),
              isRegisterMerchant: isMerchant,
              phoneNumber: phoneNumber.text,
              regularUser: RegularUserModel(
                name: fullName.text,
                email: email.text,
                password: password.text,
              )).toJson())
          .whenComplete(() {
        Get.to(() => SignInUserScreen());
      });
    }
  }
}
