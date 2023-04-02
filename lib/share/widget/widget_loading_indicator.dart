import 'package:flutter/material.dart';

import '../constant/constant.dart';

class OnLoadingIndicator extends StatelessWidget {
  const OnLoadingIndicator({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: kPrimaryColor,
                    ))),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                )),
          ),
        ],
      ),
    );
  }
}

class LoadingIndicator {
  static RawDialogRoute? loadingDialogRoute;

  static show(BuildContext context) {
    if (loadingDialogRoute != null) return;
    loadingDialogRoute = RawDialogRoute(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        pageBuilder: (context, _, __) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(30),
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            ),
          );
        });
    Navigator.of(context, rootNavigator: true).push(loadingDialogRoute!);
  }

  static hide(BuildContext context) {
    if (loadingDialogRoute != null) {
      Navigator.of(context).removeRoute(loadingDialogRoute!);
      loadingDialogRoute = null;
    }
  }
}
