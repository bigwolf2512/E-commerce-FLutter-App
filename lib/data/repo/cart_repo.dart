import 'dart:convert';
import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app_const/app_const.dart';
import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;
  CartRepo({required this.sharedPreferences, required this.apiClient});
  List<String> _cartString = [];
  final List<CartModel> _cartInstance = [];

  Future<void> addToCartList(List<CartModel> cartList) async {
    _cartString = [];

    cartList.forEach(
      (element) {
        return _cartString.add(
          jsonEncode(element),
        );
      },
    );
    sharedPreferences.setStringList(cartlistKey, _cartString);
    getCartInstance();
  }

  List<CartModel> getCartInstance() {
    //sharedPreferences.remove(cartlistKey);
    List<String> getCartString = [];
    if (sharedPreferences.containsKey(cartlistKey)) {
      getCartString = sharedPreferences.getStringList(cartlistKey)!;
    }

    getCartString.forEach((element) {
      return _cartInstance.add(CartModel.fromJson(jsonDecode(element)));
    });
    return _cartInstance;
  }
}
