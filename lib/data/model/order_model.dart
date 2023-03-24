import 'package:freezed_annotation/freezed_annotation.dart';

import 'buyer_model.dart';
import 'product_model.dart';
import 'seller_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    String? id,
    SellerModel? seller,
    BuyerModel? buyer,
    ProductModel? product,
    DateTime? boughtDate,
    DateTime? receiveExpectDate,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
