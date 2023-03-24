import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  static imagePickerSelections(BuildContext context) async {
    final ImagePicker imagePicker = ImagePicker();
    final result = await showDialog<String>(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Choose'),
            content: SizedBox(
              height: 0.1.h,
              width: 0.8.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 2),
                  InkWell(
                      onTap: () async {
                        final result = await imagePicker.pickImage(
                            source: ImageSource.camera);

                        if (result != null) {
                          Navigator.pop(context, result.path);
                        }
                      },
                      child: Text('Open Camera')),
                  SizedBox(height: 12),
                  InkWell(
                      onTap: () async {
                        final result = await imagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (result != null) {
                          Navigator.pop(context, result.path);
                        }
                      },
                      child: Text('Open Galary')),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'))
            ],
          );
        });
    return result;
  }
}
