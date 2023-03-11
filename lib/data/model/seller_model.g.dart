// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SellerModel _$$_SellerModelFromJson(Map<String, dynamic> json) =>
    _$_SellerModel(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      storeAddress: json['storeAddress'] as String?,
      storeName: json['storeName'] as String?,
      storeId: json['storeId'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      productOnSale: (json['productOnSale'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSetupStore: json['isSetupStore'] as bool? ?? true,
    );

Map<String, dynamic> _$$_SellerModelToJson(_$_SellerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'email': instance.email,
      'storeAddress': instance.storeAddress,
      'storeName': instance.storeName,
      'storeId': instance.storeId,
      'password': instance.password,
      'avatar': instance.avatar,
      'productOnSale': instance.productOnSale?.map((e) => e.toJson()).toList(),
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
      'isSetupStore': instance.isSetupStore,
    };
