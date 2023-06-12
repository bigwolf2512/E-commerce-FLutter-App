import 'package:ecommerceshop/data/model/notification_buyer_model.dart';
import 'package:ecommerceshop/data/model/notification_seller_model.dart';
import 'package:ecommerceshop/data/repo/notification_repo.dart';
import 'package:get/get.dart';
import '../repo/pref_repo.dart';

class NotificationController extends GetxController {
  NotificationController(
      this.prefRepo, this.notificationBuyerRepo, this.notificationSellerRepo);

  final NotificationBuyerRepo notificationBuyerRepo;
  final NotificationSellerRepo notificationSellerRepo;
  final PrefRepo prefRepo;

  final List<NotificationBuyerModel> _notificationsBuyer = [];
  final List<NotificationSellerModel> _notificationsSeller = [];

  int get getTotalNotificationsBuyer {
    return _notificationsBuyer.length;
  }

  int get getTotalNotificationsSeller {
    return _notificationsSeller.length;
  }

  @override
  void onInit() async {
    super.onInit();

    if (prefRepo.isCurrentSeller()) {
      _notificationsBuyer.clear();

      await notificationSellerRepo
          .getAll(id: prefRepo.getCurrentUserId(), field: 'userId')
          .then((value) {
        _notificationsSeller.addAll(value);
        update();
      });
      update();
    } else {
      _notificationsSeller.clear();

      await notificationBuyerRepo
          .getAll(id: prefRepo.getCurrentUserId(), field: 'userId')
          .then((value) {
        _notificationsBuyer.addAll(value);
        update();
      });
      update();
    }
  }
}
