import 'package:flutter/material.dart';

import 'widget/confirm_order_screen_body.dart';
import 'widget/confirm_order_screen_bottom_bar.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Please confirm your order.',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        body: SizedBox.expand(
          child: Stack(
            children: const [
              ConfirmOrderBody(),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ConfirmOrderBottom()),
            ],
          ),
        ));
  }
}
