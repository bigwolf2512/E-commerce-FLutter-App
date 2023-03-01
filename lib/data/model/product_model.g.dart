// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      status: json['status'] as String?,
      image: json['image'] as String?,
      sellerId: json['sellerId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'quantity': instance.quantity,
      'status': instance.status,
      'image': instance.image,
      'sellerId': instance.sellerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
