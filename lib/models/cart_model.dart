// ignore_for_file: prefer_collection_literals

import 'package:ecommerceshop/models/popular_product_model.dart';

class Carts {
  List<CartModel>? carts;

  Carts({this.carts});

  Carts.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <CartModel>[];
      json['carts'].forEach((v) {
        carts!.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel {
  int? id;
  String? name;
  int? price;
  int? stars;
  String? image;
  int? quantity;
  bool? isExist;
  String? time;
  bool? isSelect;
  int? sellerId;
  // Products? products;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.stars,
    this.image,
    this.quantity,
    this.isExist,
    this.time,
    this.isSelect,
    this.sellerId,
    //   this.products,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stars = json['stars'];
    image = json['image'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    isSelect = json['isSelect'];
    sellerId = json['sellerId'];
    //  products = Products.fromJson(json['products']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "stars": stars,
      "image": image,
      "quantity": quantity,
      "isExist": isExist,
      "time": time,
      "isSelect": isSelect,
      "sellerId": sellerId,
      //     "products": products!.toJson(),
    };
  }
}
