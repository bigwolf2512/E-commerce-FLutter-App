// import 'dart:convert';

// import 'package:ecommerceshop/data/api/api_client.dart';
// import 'package:ecommerceshop/data/repo/product_repo.dart';
// import 'package:get/get.dart';

// import '../model/product_model.dart';
// import 'package:http/http.dart' as http;

// class ProductController extends GetxController {
//   final ApiClient apiClient;
//   ProductController({required this.apiClient});
//   List<dynamic> _productList = [];
//   List<dynamic> get productList => _productList;
//   Future getproductList() async {
//     http.Response response = await apiClient.getProducts();
//     if (response.statusCode == 200) {
//       _productList = [];
//       _productList
//           .addAll(ProductModel.fromJson(jsonDecode(response.body)).products!);
//     } else {}
//     update();
//   }
// }
