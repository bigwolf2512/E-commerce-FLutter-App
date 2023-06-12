import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_seller_model.freezed.dart';
part 'notification_seller_model.g.dart';

@freezed
class NotificationSellerModel with _$NotificationSellerModel {
  const factory NotificationSellerModel({
    String? id,
    String? userId,
    String? title,
    String? description,
    @Default(false) bool seen,
    DateTime? sendAt,
  }) = _NotificationSellerModel;

  factory NotificationSellerModel.fromJson(Map<String, Object?> json) =>
      _$NotificationSellerModelFromJson(json);
}
