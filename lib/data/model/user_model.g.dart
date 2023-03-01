// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      token: json['token'] as String?,
      isRegisterMerchant: json['isRegisterMerchant'] as bool?,
      merchantUser: json['merchantUser'] == null
          ? null
          : MerchantUserModel.fromJson(
              json['merchantUser'] as Map<String, dynamic>),
      regularUser: json['regularUser'] == null
          ? null
          : RegularUserModel.fromJson(
              json['regularUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'isRegisterMerchant': instance.isRegisterMerchant,
      'merchantUser': instance.merchantUser,
      'regularUser': instance.regularUser,
    };
