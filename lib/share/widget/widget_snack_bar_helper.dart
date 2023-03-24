import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static showSnackBar(BuildContext context,
      {ContentType? contentType, String title = '', String subTitle = ''}) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: subTitle,
        contentType: contentType ?? ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Future.delayed(const Duration(seconds: 5),
    //     () => ScaffoldMessenger.of(context).hideCurrentSnackBar());
  }

  static showBanner(BuildContext context,
      {required String title, String subTitle = ''}) {
    final materialBanner = MaterialBanner(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: 'Oh Hey!!',
        message:
            'This is an example error message that will be shown in the body of materialBanner!',

        /// change contentType to ContentType.succesas, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
        // to configure for material banner
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }
}
