import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    String? id,
    String? buyerId,
    String? sellerId,
    String? title,
    String? description,
    @Default(false) bool seen,
    @Default(false) bool sendByBuyer,
    DateTime? sendAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
