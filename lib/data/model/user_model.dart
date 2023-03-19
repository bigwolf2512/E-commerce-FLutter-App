import 'package:freezed_annotation/freezed_annotation.dart';

import 'buyer_model.dart';
import 'seller_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    SellerModel? sellerModel,
    BuyerModel? buyerModel,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
