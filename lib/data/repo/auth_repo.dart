import 'package:shared_preferences/shared_preferences.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';
import '../model/buyer_model.dart';
import '../model/seller_model.dart';

class SellerAuthRepo extends FirebaseCRUDCore<SellerModel> {
  SellerAuthRepo(this.sharedPreferences)
      : super(pathCollection: kPathCollectionSeller);

  final SharedPreferences sharedPreferences;

  @override
  SellerModel fromJson(Map<String, dynamic> json) {
    return SellerModel.fromJson(json);
  }
}

class BuyerAuthRepo extends FirebaseCRUDCore<BuyerModel> {
  BuyerAuthRepo(this.sharedPreferences)
      : super(pathCollection: kPathCollectionBuyer);

  final SharedPreferences sharedPreferences;

  @override
  BuyerModel fromJson(Map<String, dynamic> json) {
    return BuyerModel.fromJson(json);
  }
}
