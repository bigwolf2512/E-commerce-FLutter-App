// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as num?,
      description: json['description'] as String?,
      quantity: json['quantity'] as num?,
      totalQuantity: json['totalQuantity'] as num?,
      status: json['status'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ImageModel>[],
      sellerId: json['sellerId'] as String?,
      seller: json['seller'] == null
          ? null
          : SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      chatId: json['chatId'] as String?,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'quantity': instance.quantity,
      'totalQuantity': instance.totalQuantity,
      'status': instance.status,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'sellerId': instance.sellerId,
      'seller': instance.seller?.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'chatId': instance.chatId,
    };
