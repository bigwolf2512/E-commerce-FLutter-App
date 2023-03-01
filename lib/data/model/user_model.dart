import 'package:freezed_annotation/freezed_annotation.dart';

import 'merchant_user_model.dart';
import 'regular_user_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? token,
    bool? isRegisterMerchant,
    MerchantUserModel? merchantUser,
    RegularUserModel? regularUser,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
