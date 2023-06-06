import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    String? chatId,
    String? message,
    DateTime? sentAt,
    DateTime? seenAt,
    DateTime? createdAt,
    @Default(false) bool isUserMessage,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}
