import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';
import 'product_model.dart';

part 'buyer_model.freezed.dart';
part 'buyer_model.g.dart';

@freezed
class BuyerModel with _$BuyerModel {
  const factory BuyerModel({
    String? id,
    String? phoneNumber,
    String? name,
    String? email,
    String? address,
    String? avatar,
    String? password,
    List<ProductModel>? productOnCart,
    List<OrderModel>? orders,
  }) = _BuyerModel;

  factory BuyerModel.fromJson(Map<String, Object?> json) =>
      _$BuyerModelFromJson(json);
}
