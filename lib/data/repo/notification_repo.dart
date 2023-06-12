import 'package:ecommerceshop/data/model/notification_seller_model.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';
import '../model/notification_buyer_model.dart';

class NotificationBuyerRepo extends FirebaseCRUDCore<NotificationBuyerModel> {
  NotificationBuyerRepo()
      : super(pathCollection: kPathCollectionNotificationBuyer);

  @override
  NotificationBuyerModel fromJson(Map<String, dynamic> json) {
    return NotificationBuyerModel.fromJson(json);
  }
}

class NotificationSellerRepo extends FirebaseCRUDCore<NotificationSellerModel> {
  NotificationSellerRepo()
      : super(pathCollection: kPathCollectionNotificationSeller);

  @override
  NotificationSellerModel fromJson(Map<String, dynamic> json) {
    return NotificationSellerModel.fromJson(json);
  }
}
