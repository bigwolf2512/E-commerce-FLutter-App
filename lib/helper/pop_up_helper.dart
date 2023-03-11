import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../share/constant/constant.dart';

class PopupHelper {
  static showToastSuccess({required String msg}) {
    return Fluttertoast.showToast(
        backgroundColor: kPrimaryColor,
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showToastError({required String msg}) {
    return Fluttertoast.showToast(
        backgroundColor: Colors.red,
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
