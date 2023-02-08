import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/api_client.dart';
import 'data/controller/auth_controller.dart';
import 'data/controller/cart_controller.dart';
import 'data/controller/popular_product_controller.dart';
import 'data/controller/product_controller.dart';
import 'data/controller/recommended_product_controller.dart';
import 'data/model/popular_product_model.dart';
import 'data/repo/auth_repo.dart';
import 'data/repo/cart_repo.dart';
import 'data/repo/popular_product_repo.dart';
import 'data/repo/recommended_product_repo.dart';
import 'share/constant/constant.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(
    () => ApiClient(appBaseUrl: BASE_URL),
  );

  Get.lazyPut(
    () => PopularProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductRepo(
      apiClient: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartRepo(
      sharedPreferences: Get.find(),
      apiClient: Get.find(),
    ),
  );

  Get.lazyPut(
    () => PopularProductController(
      productRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => RecommendedProductController(
      productRepo: Get.find(),
    ),
  );
  Get.lazyPut(
    () => CartController(
      sharedPreferences: Get.find(),
      cartRepo: Get.find(),
      apiClient: Get.find(),
      productController: Get.find(),
    ),
  );

  Get.lazyPut(
    () => AuthRepo(sharedPreferences: sharedPreferences),
  );
  Get.lazyPut(
    () => AuthController(
        apiClient: Get.find(),
        cartController: Get.find(),
        authRepo: Get.find(),
        sharedPreferences: sharedPreferences),
  );
  Get.lazyPut(
    () => ProductController(
      apiClient: Get.find(),
    ),
  );

  Get.lazyPut(
    () => Products(),
  );
}
