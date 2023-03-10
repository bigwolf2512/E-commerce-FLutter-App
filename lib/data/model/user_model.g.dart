// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
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
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'isRegisterMerchant': instance.isRegisterMerchant,
      'merchantUser': instance.merchantUser?.toJson(),
      'regularUser': instance.regularUser?.toJson(),
    };
