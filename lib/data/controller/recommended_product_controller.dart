// import 'package:get/get.dart';
// import '../model/product_model.dart';
// import '../repo/recommended_product_repo.dart';

// class RecommendedProductController extends GetxController {
//   late final RecommendedProductRepo productRepo;
//   RecommendedProductController({required this.productRepo});

//   List<dynamic> _recommendedproductList = [];
//   List<dynamic> get recommendedproductList => _recommendedproductList;

//   Future<void> getrecommendedproductList() async {
//     Response response = await productRepo.getRecommendedProductRepo();
//     if (response.statusCode == 200) {
//       _recommendedproductList = [];
//       _recommendedproductList
//           .addAll(ProductModel.fromJson(response.body).products!);
//     } else {}
//     update();
//   }
// }
