// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:ecommerceshop/data/controller/product_controller.dart';
import 'package:ecommerceshop/models/cart_model.dart';
import 'package:ecommerceshop/models/popular_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repo/cart_repo.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';

class CartController extends GetxController {
  final ApiClient apiClient;
  final CartRepo cartRepo;
  final SharedPreferences sharedPreferences;
  final ProductController productController;
  CartController({
    required this.productController,
    required this.sharedPreferences,
    required this.cartRepo,
    required this.apiClient,
  });
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  bool _exist = false;
  List<CartModel> storageItems = [];
  List<CartModel> _checkoutItems = [];
  List<CartModel> get checkoutItems => _checkoutItems;
  Map<int, List<CartModel>> _orderItems = {};
  //Map<int, List<CartModel>> get orderItems => _orderItems;
  int get lengthCart => items.length;
  bool _removeAble = false;
  bool get removeAble => _removeAble;

  Future storeTransactions(String incartQuantity, String buyerId,
      String productId, int quantity) async {
    http.Response response =
        await apiClient.storeTransactions(incartQuantity, buyerId, productId);
    if (response.statusCode == 200) {}
  }

  Future removeTransactions(int buyerId, int productId) async {
    http.Response response =
        await apiClient.removeTransactions(buyerId, productId);
    if (response.statusCode == 200) {}
  }

  List<CartModel> getProductId = [];
  Future getCarts(int id) async {
    http.Response response = await apiClient.getCarts(id);
    if (response.statusCode == 200) {
      getProductId = Carts.fromJson(jsonDecode(response.body)).carts!;
      for (int i = 0; i < getProductId.length; i++) {
        _items.putIfAbsent(getProductId[i].id!, () => getProductId[i]);
      }
    }
  }

  Future addItems(Products products, int _quantity) async {
    checkSelected() {
      for (int i = 0; i < getCartItems.length; i++) {
        if (getCartItems[i].id == products.id) {
          return getCartItems[i].isSelect;
        } else {
          return false;
        }
      }
    }

    var totalQuantity;
    if (_items.containsKey(products.id)) {
      _items.update(
        products.id!,
        (value) {
          totalQuantity = value.quantity! + _quantity;
          if (totalQuantity == 0 && _quantity == -1) {
            _removeAble = true;
            return CartModel(
              id: value.id,
              name: value.name,
              price: value.price,
              stars: value.stars,
              image: value.image,
              quantity: value.quantity!,
              isExist: true,
              isSelect: checkSelected(),
              time: TimeOfDay.now().toString(),
            );
          }
          if (totalQuantity == 0 && _quantity != -1) {
            _removeAble = false;
            return CartModel(
              id: value.id,
              name: value.name,
              price: value.price,
              stars: value.stars,
              image: value.image,
              quantity: value.quantity! + _quantity,
              isExist: true,
              isSelect: checkSelected(),
              time: TimeOfDay.now().toString(),
            );
          } else {
            _removeAble = false;
            return CartModel(
              id: value.id,
              name: value.name,
              price: value.price,
              stars: value.stars,
              image: value.image,
              quantity: value.quantity! + _quantity,
              isExist: true,
              isSelect: checkSelected(),
              time: TimeOfDay.now().toString(),
            );
          }
        },
      );
    } else {
      _removeAble = false;
      _items.putIfAbsent(
        products.id!,
        () {
          return CartModel(
            id: products.id,
            name: products.name,
            price: int.parse(products.price.toString()),
            image: products.image,
            quantity: _quantity,
            isExist: true,
            isSelect: false,
            time: TimeOfDay.now().toString(),
          );
        },
      );
    }
    cartRepo.addToCartList(getCartItems);
    storeTransactions(
        totalQuantity.toString(),
        Get.find<AuthController>().userData.id.toString(),
        products.id.toString(),
        _quantity);
    selectedPrice;
    update();
  }

  List<CartModel> get getCartItems {
    return _items.entries.map((e) => e.value).toList();
  }

  List<CartModel> setcheckoutItems() {
    _items.forEach((key, value) {
      if (value.isSelect ?? false) {
        _checkoutItems.add(value);
      }
    });
    print(_checkoutItems);
    return _checkoutItems;
  }

  List<CartModel> setcheckoutItem(int productId, int quantity) {
    Map<int, CartModel> mapCarts = {};
    for (var e in productController.productList) {
      mapCarts.putIfAbsent(
          e.id,
          () => CartModel(
                id: e.id,
                name: e.name,
                price: int.parse(e.price.toString()),
                image: e.image,
                quantity: quantity,
                isExist: true,
                isSelect: false,
                time: TimeOfDay.now().toString(),
              ));
    }
    List<CartModel> listCarts = mapCarts.entries.map((e) => e.value).toList();
    for (int i = 0; i < productController.productList.length; i++) {
      if (productController.productList[i].id == productId) {
        _checkoutItems.add(listCarts[i]);
      }
    }
    return _checkoutItems;
  }

  int _orderId = 1;
  int get orderId => _orderId;
  Map<int, dynamic> get orderItems {
    if (_checkoutItems.isNotEmpty) {
      _orderItems.putIfAbsent(
        _orderId,
        () => _checkoutItems,
      );
      _orderId++;
    }
    print(_orderItems);
    print(_orderId);
    return _orderItems;
  }

  List<List<CartModel>> get getOrderList {
    return _orderItems.entries.map((e) => e.value).toList();
  }

  List<int> get getPerOrderItemsLength {
    List<int> length = [];
    length = _orderItems.entries.map((e) => e.value.length).toList();
    return length;
  }

  int get getOrderItemsLength {
    return _orderItems.length;
  }

  int get getCheckOutLenght {
    return _checkoutItems.length;
  }

  initCheckOutItems() {
    print('deleted');
    _checkoutItems = [];
  }

  void removeItems(Products products, bool removeAble) {
    if (removeAble) {
      _items.remove(products.id);
      removeTransactions(Get.find<AuthController>().userData.id!, products.id!);
      getCartItems;
      cartRepo.addToCartList(getCartItems);
    }
    update();
  }

  bool existItems(int productID) {
    if (_items.containsKey(productID)) {
      _exist = true;
    } else {
      _exist = false;
    }
    return _exist;
  }

  int getQuantity(int productID) {
    int _quantity = 0;
    if (_items.containsKey(productID)) {
      _items.forEach(
        (key, value) {
          if (key == productID) {
            _quantity = value.quantity!;
          }
        },
      );
    }
    return _quantity;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartInstance();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].id!, () => storageItems[i]);
    }
    update();
  }

  void setSelectedAll(bool value) {
    for (var element in getCartItems) {
      element.isSelect = value;
    }
    update();
  }

  void setSelected(bool value, int index) {
    getCartItems[index].isSelect = value;
    update();
  }

  double get totalPrice {
    double _totalPrice = 0;
    for (var element in getCartItems) {
      _totalPrice += element.quantity! * element.price!;
    }
    return _totalPrice;
  }

  double get selectedPrice {
    double _selectedPrice = 0;
    for (var element in getCartItems) {
      if (element.isSelect ?? false) {
        _selectedPrice += element.quantity! * element.price!;
      }
    }
    return _selectedPrice;
  }

  checkItemsLogout() {
    _items = {};
  }
}
