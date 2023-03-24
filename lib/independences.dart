import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'data/controller/auth_controller.dart';
import 'data/controller/cart_controller.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/notification_repo.dart';
import 'data/repo/order_repo.dart';
import 'data/repo/pref_repo.dart';
import 'data/repo/product_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut<Uuid>(() => Uuid());

  Get.lazyPut<SellerAuthRepo>(() => SellerAuthRepo(sharedPreferences));
  Get.lazyPut<BuyerAuthRepo>(() => BuyerAuthRepo(sharedPreferences));
  Get.lazyPut<PrefRepo>(() => PrefRepo(sharedPreferences));
  Get.lazyPut<ProductRepo>(() => ProductRepo());
  Get.lazyPut<OrderRepo>(() => OrderRepo());
  Get.lazyPut<NotificationRepo>(() => NotificationRepo());

  Get.lazyPut<AuthController>(() => AuthController(Get.find(), Get.find(),
      sharedPreferences, Get.find(), Get.find(), Get.find()));
  Get.lazyPut<CartController>(
      () => CartController(Get.find(), Get.find(), Get.find())..onInit());
}
