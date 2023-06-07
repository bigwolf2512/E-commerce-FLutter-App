// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const appBackgroundColor = Color(0xFFe8eaed);

const kMainColor = Color(0xFF010F07);
const kActiveColor = Color(0xFF22A45D);
const kAccentColor = Color(0xFFEF7320);
const kBodyTextColor = Color.fromARGB(255, 3, 2, 2);
const kInputColor = Color(0xFFFBFBFB);
const kBgColor = Colors.white;
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const backgroundcolor = Color(0xffffffff);
const kSecondaryColor = Color.fromARGB(34, 151, 151, 151);
const kTextColor = Color(0xFF757575);
const double defaultPadding = 16;
const String BASE_URL = 'https://bw-ecommerceapp.herokuapp.com/';
const String URI_PRODUCTS = 'api/products';
const String URI_PRODUCTS_BY_CATEGORY = 'api/productsbycategory/';
const String URI_LOGIN = 'api/auth/login';
const String URI_REGISTER = 'api/auth/register';
const String URI_TRANSACTIONS = 'api/transactions';
const String URI_CARTS = 'api/carts';
const int POPULAR_CATEGORY_ID = 1;
const int RECOMMENDED_CATEGORY_ID = 2;

const String cartlistKey = "Cart-List";

List<String> EventListIcons = [
  'assets/icons/Game Icon.svg',
  'assets/icons/Gift Icon.svg',
  'assets/icons/Flash Icon.svg',
  'assets/icons/Discover.svg',
  'assets/icons/Location point.svg'
];
List<String> EventListTitles = ['Games', 'Gift', 'Sale', 'Global', 'Locations'];
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.red;
}

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(text),
      duration: const Duration(milliseconds: 1000)));
}
