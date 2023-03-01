import 'package:freezed_annotation/freezed_annotation.dart';

import 'merchant_user_model.dart';
import 'product_model.dart';
import 'regular_user_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    String? id,
    MerchantUserModel? seller,
    RegularUserModel? buyer,
    List<ProductModel>? products,
    DateTime? boughtDate,
    DateTime? receiveExpectDate,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, Object?> json) =>
      _$OrderModelFromJson(json);
}
