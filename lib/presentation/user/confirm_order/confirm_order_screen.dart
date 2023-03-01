import 'package:flutter/material.dart';
import 'widget/confirm_order_screen_body.dart';
import 'widget/confirm_order_screen_bottom_bar.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            ConfirmOrderBody(),
            ConfirmOrderBottom(),
          ],
        ),
      )),
    );
  }
}
