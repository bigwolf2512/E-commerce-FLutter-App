// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantUserModel _$$_MerchantUserModelFromJson(Map<String, dynamic> json) =>
    _$_MerchantUserModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      storeAddress: json['storeAddress'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      productOnSale: (json['productOnSale'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MerchantUserModelToJson(
        _$_MerchantUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'storeAddress': instance.storeAddress,
      'password': instance.password,
      'avatar': instance.avatar,
      'productOnSale': instance.productOnSale?.map((e) => e.toJson()).toList(),
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
    };
