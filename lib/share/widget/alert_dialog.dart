import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static confirmAlertCartPage(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove this item?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    Get.snackbar("Notification", "Remove successfull",
                        colorText: Colors.white,
                        backgroundColor: Colors.deepOrange);
                  },
                  child: const Text('Confirm')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
    return result;
  }
}
