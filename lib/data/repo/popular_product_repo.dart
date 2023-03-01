// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ecommerceshop/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../share/constant/constant.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});
}
