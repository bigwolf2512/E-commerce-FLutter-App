import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../app_const/app_const.dart';

class ApiClient extends GetConnect implements GetxService {
  String token = '';
  final String appBaseUrl;
  late Map<String, String> mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer$token',
    };
  }
  updateUserHeader(String token) {
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer$token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<http.Response> removeTransactions(int buyerId, int productId) async {
    Map data = {
      "buyerId": buyerId,
      "productId": productId,
    };
    var body = json.encode(data);
    var url = Uri.parse(BASE_URL + URI_TRANSACTIONS + '-remove');
    http.Response response = await http.delete(url,
        headers: {'Content-Type': 'application/json'}, body: body);
    return response;
  }

  Future<http.Response> storeTransactions(
      String quantity, String buyerId, String productId) async {
    Map data = {
      "quantity": quantity,
      "buyer_id": buyerId,
      "product_id": productId,
    };
    var body = json.encode(data);

    var url = Uri.parse(BASE_URL + URI_TRANSACTIONS);
    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: body);
    return response;
  }

  Future<http.Response> getCarts(int buyerId) async {
    var url = Uri.parse(BASE_URL + URI_CARTS + '/${buyerId}');
    http.Response response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<http.Response> getProducts() async {
    var url = Uri.parse(BASE_URL + URI_PRODUCTS);
    http.Response response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(BASE_URL + URI_LOGIN);
    http.Response response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: body);
    return response;
  }

  Future<http.Response> register(
      String name, String email, String phonenumber, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "phone_number": phonenumber,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(BASE_URL + URI_REGISTER);
    http.Response response = await http.post(url,
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response;
  }
}
