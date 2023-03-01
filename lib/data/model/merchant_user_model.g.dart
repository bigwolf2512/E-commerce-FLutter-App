// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MerchantUserModel _$$_MerchantUserModelFromJson(Map<String, dynamic> json) =>
    _$_MerchantUserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      storePhoneNumber: json['storePhoneNumber'] as String?,
      storeAddress: json['storeAddress'] as String?,
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
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'storePhoneNumber': instance.storePhoneNumber,
      'storeAddress': instance.storeAddress,
      'productOnSale': instance.productOnSale,
      'orders': instance.orders,
    };
