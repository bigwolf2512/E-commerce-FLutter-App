// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regular_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegularUserModel _$$_RegularUserModelFromJson(Map<String, dynamic> json) =>
    _$_RegularUserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      productOnCart: (json['productOnCart'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RegularUserModelToJson(_$_RegularUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'productOnCart': instance.productOnCart,
      'orders': instance.orders,
    };
