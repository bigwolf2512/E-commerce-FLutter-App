import 'package:get/get.dart';

import '../model/notification_model.dart';
import '../repo/notification_repo.dart';
import '../repo/pref_repo.dart';

class NotificationController extends GetxController {
  NotificationController(this.notificationRepo, this.prefRepo);

  final NotificationRepo notificationRepo;
  final PrefRepo prefRepo;

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  int get getTotalNotifications {
    return notifications.length;
  }

  @override
  void onInit() async {
    super.onInit();

    String id = prefRepo.getCurrentUser().buyerModel?.id ?? '';

    _notifications.clear();

    await notificationRepo.getAll(id: id, field: 'buyerId').then((value) {
      _notifications = value;
      update();
    });
    update();
  }
}
