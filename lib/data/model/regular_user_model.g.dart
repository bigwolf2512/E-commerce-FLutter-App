// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regular_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegularUserModel _$$_RegularUserModelFromJson(Map<String, dynamic> json) =>
    _$_RegularUserModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      password: json['password'] as String?,
      productOnCart: (json['productOnCart'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegularUserModelToJson(_$_RegularUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'avatar': instance.avatar,
      'password': instance.password,
      'productOnCart': instance.productOnCart?.map((e) => e.toJson()).toList(),
      'orders': instance.orders?.map((e) => e.toJson()).toList(),
    };
