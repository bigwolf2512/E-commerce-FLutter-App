import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/controller/auth_controller.dart';
import 'data/controller/cart_controller.dart';
import 'data/controller/popular_product_controller.dart';
import 'data/controller/product_controller.dart';
import 'data/controller/recommended_product_controller.dart';
import 'independences.dart' as dep;
import 'presentation/merchant/main_page/main_food_page.dart';
import 'share/constant/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getproductList();
    Get.find<AuthController>().getUserProfile();
    Get.find<AuthController>().TOKEN.isNotEmpty
        ? Get.find<CartController>()
            .getCarts(Get.find<AuthController>().userData.id!)
        : Get.find<CartController>().checkItemsLogout();
    return GetBuilder<CartController>(
      builder: (_) {
        return GetBuilder<PopularProductController>(
          builder: (_) {
            return GetBuilder<RecommendedProductController>(
              builder: (_) {
                return GetBuilder<AuthController>(
                  builder: (_) {
                    return GetBuilder<ProductController>(
                      builder: (_) {
                        print('API CHECKED ');
                        return GetMaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Flutter Demo',
                          theme: ThemeData(
                            primaryColor: kPrimaryColor,
                            scaffoldBackgroundColor: Colors.white,
                          ),
                          home: MerchantMainFoodPage(),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
