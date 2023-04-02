import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceshop/data/firebase/firebase_storage_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../helper/navigator_helper.dart';
import '../../helper/pop_up_helper.dart';
import '../../presentation/after_auth_seller/setup_store/setup_products_page.dart';
import '../../presentation/after_auth_seller/setup_store/setup_store_page.dart';
import '../../presentation/feature_shared/auth/log_in_buyer/log_in_buyer_page.dart';
import '../../presentation/feature_shared/auth/log_in_seller/log_in_seller.dart';
import '../../presentation/feature_shared/auth/welcome_screen/welcome_screen.dart';
import '../../presentation/feature_shared/home/home_screen.dart';
import '../../share/widget/widget_loading_indicator.dart';
import '../../share/widget/widget_snack_bar_helper.dart';
import '../constant/path_collection.dart';
import '../constant/path_spref.dart';
import '../model/buyer_model.dart';
import '../model/image_model.dart';
import '../model/product_model.dart';
import '../model/seller_model.dart';
import '../model/user_model.dart';
import '../repo/auth_repo.dart';
import '../repo/notification_repo.dart';
import '../repo/pref_repo.dart';
import '../repo/product_repo.dart';

class AuthController extends GetxController {
  AuthController(this.sellerRepo, this.buyerRepo, this.sharedPreferences,
      this.prefRepo, this.productRepo, this.notificationRepo);

  final SellerAuthRepo sellerRepo;
  final BuyerAuthRepo buyerRepo;
  final PrefRepo prefRepo;
  final ProductRepo productRepo;
  final NotificationRepo notificationRepo;
  final SharedPreferences sharedPreferences;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final phoneNumber = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final storeName = TextEditingController();
  final storeAddress = TextEditingController();
  final storeAvatar = TextEditingController();

  SellerModel _sellerModel = SellerModel();
  SellerModel get sellerModel => _sellerModel;

  initSellerInfo() async {
    SellerModel? sellerModel = prefRepo.getCurrentUser().sellerModel;
    _sellerModel = await sellerRepo.getOne(sellerModel?.id ?? '');
    update();
  }

  final List<ProductModel> _newProducts = [];
  List<ProductModel> get newProducts => _newProducts;

  insertNewProducts() {
    _newProducts.add(ProductModel(
      id: Get.find<Uuid>().v1(),
    ));
    update();
  }

  String getImage(int indexImage, int indexProduct) {
    if (_newProducts.isEmpty) return '';
    if (_newProducts[indexProduct].images.isEmpty) return '';

    return _newProducts[indexProduct].images[indexImage].localPath ?? '';
  }

  updateProducts({
    required int index,
    String? name,
    num? totalQuantity,
    String? description,
    num? price,
    String? path,
  }) {
    ProductModel productModel = _newProducts[index];

    String _path = 'images/${sellerModel.storeId}/${productModel.id}';
    String _imageId = Get.find<Uuid>().v1();

    productModel = productModel.copyWith(
      name: name ?? productModel.name,
      totalQuantity: totalQuantity ?? productModel.totalQuantity,
      price: price ?? productModel.price,
      description: description ?? description,
      images: path != null
          ? [
              ...productModel.images,
              ImageModel(
                  id: _imageId, path: '$_path/$_imageId', localPath: path)
            ]
          : [...productModel.images],
    );

    _newProducts[index] = productModel;
    update();
  }

  uploadProducts(BuildContext context) async {
    try {
      LoadingIndicator.show(context);

      if (_sellerModel == SellerModel()) return;

      List<Future> _futures = [];

      for (ProductModel product in _newProducts) {
        _futures.add(productRepo.create(product.toJson()));

        for (ImageModel image in product.images) {
          _futures.add(FirebaseStorageCore.uploadImagePath(
            firebaseStoragePath: image.path,
            localPath: image.localPath,
          ));
        }
      }

      await Future.wait(_futures).then((_) async {
        _sellerModel = _sellerModel.copyWith(
          productOnSale: _newProducts,
          isSetupStore: true,
        );

        await sellerRepo
            .update(data: _sellerModel.toJson(), id: _sellerModel.id)
            .then((_) {
          LoadingIndicator.hide(context);
          Push.to(context, HomePage());
        });
      });

      update();
    } catch (e) {
      LoadingIndicator.hide(context);
    }
  }

  getNewProduct(int index) {
    return _newProducts[index];
  }

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

    if (isSeller) {
      final SellerModel sellerModel = SellerModel(
        id: Get.find<Uuid>().v1(),
        phoneNumber: phoneNumber.text,
        name: fullName.text,
        email: email.text,
        password: password.text,
        isSetupStore: false,
      );

      await sellerRepo.create(sellerModel.toJson()).whenComplete(() {
        LoadingIndicator.hide(context);
        Push.to(context, SignInMerchantScreen());
      });
    } else {
      final BuyerModel buyerModel = BuyerModel(
        id: Get.find<Uuid>().v1(),
        phoneNumber: phoneNumber.text,
        name: fullName.text,
        email: email.text,
        password: password.text,
      );

      await buyerRepo.create(buyerModel.toJson()).whenComplete(() {
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
    try {
      if (storeName.text.isEmpty) return;
      LoadingIndicator.show(context);
      SellerModel sellerModel = await sellerRepo
          .getOne(prefRepo.getCurrentUser().sellerModel?.id ?? '');

      sellerModel = sellerModel.copyWith(
        storeId: Get.find<Uuid>().v1(),
        storeName: storeName.text,
        storeAddress: storeAddress.text,
      );

      print(sellerModel.toJson().toString());

      await sellerRepo
          .update(data: sellerModel.toJson(), id: sellerModel.id)
          .then((_) {
        LoadingIndicator.hide(context);
        Push.to(context, SetupProductPage());
      });
    } catch (e) {
      LoadingIndicator.hide(context);
    }
  }
}
