import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_buyer_model.freezed.dart';
part 'notification_buyer_model.g.dart';

@freezed
class NotificationBuyerModel with _$NotificationBuyerModel {
  const factory NotificationBuyerModel({
    String? id,
    String? userId,
    String? title,
    String? description,
    @Default(false) bool seen,
    DateTime? sendAt,
  }) = _NotificationBuyerModel;

  factory NotificationBuyerModel.fromJson(Map<String, Object?> json) =>
      _$NotificationBuyerModelFromJson(json);
}
