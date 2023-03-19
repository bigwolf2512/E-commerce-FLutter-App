// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      sellerModel: json['sellerModel'] == null
          ? null
          : SellerModel.fromJson(json['sellerModel'] as Map<String, dynamic>),
      buyerModel: json['buyerModel'] == null
          ? null
          : BuyerModel.fromJson(json['buyerModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'sellerModel': instance.sellerModel?.toJson(),
      'buyerModel': instance.buyerModel?.toJson(),
    };
