import 'package:flutter/material.dart';

class Push {
  static to(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (c) => page));
  }
}
