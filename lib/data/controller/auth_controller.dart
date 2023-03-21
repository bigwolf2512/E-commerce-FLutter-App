import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../helper/navigator_helper.dart';
import '../../helper/pop_up_helper.dart';
import '../../presentation/after_auth_seller/setup_store/setup_store_screen.dart';
import '../../presentation/auth/log_in_buyer/log_in_buyer_page.dart';
import '../../presentation/auth/welcome_screen/welcome_screen.dart';
import '../../presentation/home/home_screen.dart';
import '../../share/widget/loading_indicator.dart';
import '../../share/widget/snack_bar_helper.dart';
import '../constant/path_collection.dart';
import '../constant/path_spref.dart';
import '../model/buyer_model.dart';
import '../model/seller_model.dart';
import '../model/user_model.dart';
import '../repo/auth_repo.dart';

class AuthController extends GetxController {
  AuthController(this.sellerRepo, this.buyerRepo, this.sharedPreferences);

  final SellerAuthRepo sellerRepo;
  final BuyerAuthRepo buyerRepo;
  final SharedPreferences sharedPreferences;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final phoneNumber = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final storeName = TextEditingController();
  final storeAddress = TextEditingController();
  final storeAvatar = TextEditingController();

  onSignIn(bool isSeller, BuildContext context) async {
    try {
      if (phoneNumber.text.isEmpty || password.text.isEmpty) return;

      LoadingIndicator.show(context);

      final CollectionReference response;

      if (isSeller) {
        response = firebaseFirestore.collection(kPathCollectionSeller);
      } else {
        response = firebaseFirestore.collection(kPathCollectionBuyer);
      }

      var documentReference =
          response.where('phoneNumber', isEqualTo: phoneNumber.text);

      final result = await documentReference.get();

      if (result.size == 0) {
        LoadingIndicator.hide(context);
        return PopupHelper.showToastError(
            msg: 'Phone number or password is wrong, try again');
      }

      if (isSeller) {
        final SellerModel sellerModel = SellerModel.fromJson(
            result.docs.first.data() as Map<String, dynamic>);
        if (password.text == sellerModel.password) {
          if (!sharedPreferences.containsKey(kPathPrefUser)) {
            sharedPreferences.setString(
                kPathPrefUser, jsonEncode(UserModel(sellerModel: sellerModel)));
          }
          LoadingIndicator.hide(context);

          if (sellerModel.isSetupStore ?? false) {
            Push.to(context, HomePage());
          } else {
            Push.to(context, SetupStoreScreen());
          }
        }
      } else {
        final BuyerModel buyerModel = BuyerModel.fromJson(
            result.docs.first.data() as Map<String, dynamic>);
        if (password.text == buyerModel.password) {
          if (!sharedPreferences.containsKey(kPathPrefUser)) {
            sharedPreferences.setString(
                kPathPrefUser, jsonEncode(UserModel(buyerModel: buyerModel)));
          }
          LoadingIndicator.hide(context);
          Push.to(context, HomePage());
          SnackBarHelper.showSnackBar(context,
              title: 'Hello ${buyerModel.name ?? ''}',
              subTitle:
                  'Welcome Back to Own E-commerce App, Hope You Have A Good Day');
        }
      }
    } catch (e) {
      LoadingIndicator.hide(context);
    }
  }

  onSignUpUser(bool isSeller, BuildContext context) async {
    if (phoneNumber.text.isEmpty ||
        fullName.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty) return null;

    LoadingIndicator.show(context);

    final CollectionReference response;

    if (isSeller) {
      response = firebaseFirestore.collection(kPathCollectionSeller);
    } else {
      response = firebaseFirestore.collection(kPathCollectionBuyer);
    }

    var documentReference =
        response.where('phoneNumber', isEqualTo: phoneNumber.text);

    final result = await documentReference.get();

    if (result.size != 0) {
      LoadingIndicator.hide(context);
      return PopupHelper.showToastError(msg: 'Phone number exist, try again');
    }

    final SellerModel sellerModel = SellerModel(
      id: Get.find<Uuid>().v1(),
      phoneNumber: phoneNumber.text,
      name: fullName.text,
      email: email.text,
      password: password.text,
      isSetupStore: false,
    );

    if (isSeller) {
      await sellerRepo.create(sellerModel.toJson()).whenComplete(() {
        if (!sharedPreferences.containsKey(kPathPrefUser)) {
          sharedPreferences.setString(
              kPathPrefUser, jsonEncode(UserModel(sellerModel: sellerModel)));
        }

        LoadingIndicator.hide(context);
        Push.to(context, SetupStoreScreen());
      });
    } else {
      final BuyerModel buyerModel = BuyerModel(
        id: Get.find<Uuid>().v1(),
        phoneNumber: phoneNumber.text,
        name: fullName.text,
        email: email.text,
        password: password.text,
      );

      buyerRepo.create(buyerModel.toJson()).whenComplete(() {
        if (!sharedPreferences.containsKey(kPathPrefUser)) {
          sharedPreferences.setString(
              kPathPrefUser, jsonEncode(UserModel(buyerModel: buyerModel)));
        }
        LoadingIndicator.hide(context);
        Push.to(context, SignInUserScreen());
      });
    }
  }

  logOut(BuildContext context) {
    sharedPreferences.clear().then((value) {
      Push.noBottomBar(context, WelcomeScreen());
    });
  }

  Future<void> onSetupStore(BuildContext context) async {
    if (storeName.text.isEmpty) return;
    SellerModel sellerModel = SellerModel();
    LoadingIndicator.show(context);
    await sellerRepo
        .update(
            data: sellerModel
                .copyWith(
                  storeId: Get.find<Uuid>().v1(),
                  storeName: storeName.text,
                  storeAddress: storeAddress.text,
                  isSetupStore: true,
                )
                .toJson(),
            id: sellerModel.id)
        .whenComplete(() {
      LoadingIndicator.hide(context);
      Push.to(context, HomePage());
    });
  }
}
