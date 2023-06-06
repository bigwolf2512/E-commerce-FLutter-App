// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      chatId: json['chatId'] as String?,
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
      isUserMessage: json['isUserMessage'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'message': instance.message,
      'sentAt': instance.sentAt?.toIso8601String(),
      'seenAt': instance.seenAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'isUserMessage': instance.isUserMessage,
    };
