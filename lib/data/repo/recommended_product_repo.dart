// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../share/constant/constant.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});
}
