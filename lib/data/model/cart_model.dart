import 'package:freezed_annotation/freezed_annotation.dart';

import 'buyer_model.dart';
import 'product_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    BuyerModel? user,
    List<ProductModel>? products,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, Object?> json) =>
      _$CartModelFromJson(json);
}
