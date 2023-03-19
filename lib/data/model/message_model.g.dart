// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      userId: json['userId'] as String?,
      chatterId: json['chatterId'] as String?,
      message: json['message'] as String?,
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      seenAt: json['seenAt'] == null
          ? null
          : DateTime.parse(json['seenAt'] as String),
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'chatterId': instance.chatterId,
      'message': instance.message,
      'sentAt': instance.sentAt?.toIso8601String(),
      'seenAt': instance.seenAt?.toIso8601String(),
    };
