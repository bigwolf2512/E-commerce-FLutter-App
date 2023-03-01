import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';
import 'product_model.dart';

part 'merchant_user_model.freezed.dart';
part 'merchant_user_model.g.dart';

@freezed
class MerchantUserModel with _$MerchantUserModel {
  const factory MerchantUserModel({
    int? id,
    String? name,
    String? email,
    String? storePhoneNumber,
    String? storeAddress,
    List<ProductModel>? productOnSale,
    List<OrderModel>? orders,
  }) = _MerchantUserModel;

  factory MerchantUserModel.fromJson(Map<String, Object?> json) =>
      _$MerchantUserModelFromJson(json);
}
