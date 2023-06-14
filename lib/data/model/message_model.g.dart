// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      id: json['id'] as String?,
      message: json['message'] as String?,
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      seenAt: json['seenAt'] == null
          ? null
          : DateTime.parse(json['seenAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      sendByBuyer: json['sendByBuyer'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'sentAt': instance.sentAt?.toIso8601String(),
      'seenAt': instance.seenAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'sendByBuyer': instance.sendByBuyer,
    };
