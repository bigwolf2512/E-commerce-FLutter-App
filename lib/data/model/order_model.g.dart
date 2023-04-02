// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as String?,
      seller: json['seller'] == null
          ? null
          : SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
      sellerId: json['sellerId'] as String?,
      buyer: json['buyer'] == null
          ? null
          : BuyerModel.fromJson(json['buyer'] as Map<String, dynamic>),
      buyerId: json['buyerId'] as String?,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      boughtDate: json['boughtDate'] == null
          ? null
          : DateTime.parse(json['boughtDate'] as String),
      receiveExpectDate: json['receiveExpectDate'] == null
          ? null
          : DateTime.parse(json['receiveExpectDate'] as String),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'seller': instance.seller?.toJson(),
      'sellerId': instance.sellerId,
      'buyer': instance.buyer?.toJson(),
      'buyerId': instance.buyerId,
      'product': instance.product?.toJson(),
      'boughtDate': instance.boughtDate?.toIso8601String(),
      'receiveExpectDate': instance.receiveExpectDate?.toIso8601String(),
    };
