import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';
import '../model/notification_model.dart';

class NotificationRepo extends FirebaseCRUDCore<NotificationModel> {
  NotificationRepo() : super(pathCollection: kPathCollectionNotification);

  @override
  NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel.fromJson(json);
  }
}
