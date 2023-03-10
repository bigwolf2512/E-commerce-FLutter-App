import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';
import 'product_model.dart';

part 'regular_user_model.freezed.dart';
part 'regular_user_model.g.dart';

@freezed
class RegularUserModel with _$RegularUserModel {
  const factory RegularUserModel({
    String? name,
    String? email,
    String? address,
    String? avatar,
    String? password,
    List<ProductModel>? productOnCart,
    List<OrderModel>? orders,
  }) = _RegularUserModel;

  factory RegularUserModel.fromJson(Map<String, Object?> json) =>
      _$RegularUserModelFromJson(json);
}
