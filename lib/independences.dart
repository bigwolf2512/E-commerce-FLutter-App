import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'data/controller/auth_controller.dart';
import 'data/repo/auth_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut<Uuid>(() => Uuid());

  Get.lazyPut<AuthRepo>(() => AuthRepo(sharedPreferences));

  Get.lazyPut<AuthController>(
      () => AuthController(Get.find(), sharedPreferences));
}
