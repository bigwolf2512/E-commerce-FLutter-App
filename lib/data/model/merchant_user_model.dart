import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';
import 'product_model.dart';

part 'merchant_user_model.freezed.dart';
part 'merchant_user_model.g.dart';

@freezed
class MerchantUserModel with _$MerchantUserModel {
  const factory MerchantUserModel({
    String? name,
    String? email,
    String? storeAddress,
    String? password,
    String? avatar,
    List<ProductModel>? productOnSale,
    List<OrderModel>? orders,
  }) = _MerchantUserModel;

  factory MerchantUserModel.fromJson(Map<String, Object?> json) =>
      _$MerchantUserModelFromJson(json);
}
