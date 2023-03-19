// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BuyerModel _$$_BuyerModelFromJson(Map<String, dynamic> json) =>
    _$_BuyerModel(
      id: json['id'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      password: json['password'] as String?,
      productInCart: (json['productInCart'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BuyerModelToJson(_$_BuyerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'avatar': instance.avatar,
      'password': instance.password,
      'productInCart': instance.productInCart?.map((e) => e.toJson()).toList(),
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
    };
