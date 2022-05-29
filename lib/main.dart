import 'package:ecommerceshop/app_const/app_const.dart';
import 'package:ecommerceshop/data/controller/auth_controller.dart';
import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:ecommerceshop/data/controller/popular_product_controller.dart';
import 'package:ecommerceshop/data/controller/product_controller.dart';
import 'package:ecommerceshop/pages/history_page/history_page.dart';
import 'package:ecommerceshop/pages/main_page/main_food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/controller/recommended_product_controller.dart';
import 'data/helper/independences.dart' as dep;

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
                          home: MainFoodPage(),
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
