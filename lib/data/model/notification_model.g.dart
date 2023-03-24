// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String?,
      buyerId: json['buyerId'] as String?,
      sellerId: json['sellerId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      seen: json['seen'] as bool? ?? false,
      sendAt: json['sendAt'] == null
          ? null
          : DateTime.parse(json['sendAt'] as String),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'title': instance.title,
      'description': instance.description,
      'seen': instance.seen,
      'sendAt': instance.sendAt?.toIso8601String(),
    };
