import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/api_client.dart';
import 'data/controller/auth_controller.dart';
import 'data/repo/auth_repo.dart';

Future<void> init() async {
  Get.lazyPut(() => SharedPreferences.getInstance());

  Get.lazyPut<ApiClient>(() => ApiClient());

  Get.lazyPut<AuthRepo>(() => AuthRepo(sharedPreferences: Get.find()));
  Get.lazyPut<AuthController>(() => AuthController());
}
