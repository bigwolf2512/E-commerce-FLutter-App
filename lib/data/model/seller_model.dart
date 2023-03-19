import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';
import 'product_model.dart';

part 'seller_model.freezed.dart';
part 'seller_model.g.dart';

@freezed
class SellerModel with _$SellerModel {
  const factory SellerModel({
    String? id,
    String? phoneNumber,
    String? name,
    String? email,
    String? storeAddress,
    String? storeName,
    String? storeId,
    String? password,
    String? avatar,
    List<ProductModel>? productOnSale,
    List<OrderModel>? orders,
    bool? isSetupStore,
  }) = _SellerModel;

  factory SellerModel.fromJson(Map<String, Object?> json) =>
      _$SellerModelFromJson(json);
}
