import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:ecommerceshop/data/controller/auth_controller.dart';
import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/data/controller/product_controller.dart';
import 'package:ecommerceshop/data/repo/auth_repo.dart';
import 'package:ecommerceshop/data/repo/cart_repo.dart';
import 'package:ecommerceshop/data/repo/popular_product_repo.dart';
import 'package:ecommerceshop/data/repo/product_repo.dart';
import 'package:ecommerceshop/models/popular_product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_const/app_const.dart';
import '../controller/recommended_product_controller.dart';
import '../repo/recommended_product_repo.dart';

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
