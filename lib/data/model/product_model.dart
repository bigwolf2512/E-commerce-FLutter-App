import 'package:freezed_annotation/freezed_annotation.dart';

import 'seller_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    String? name,
    num? price,
    String? description,
    num? quantity,
    String? status,
    String? image,
    String? sellerId,
    SellerModel? seller,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
