import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'components/appBar.dart';
import 'components/body.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(
        context,
        cartController: Get.find<CartController>(),
      ),
    );
  }
}
