// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../app_const/app_const.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductRepo() async {
    return apiClient
        .getData(URI_PRODUCTS_BY_CATEGORY + '${POPULAR_CATEGORY_ID}');
  }
}
