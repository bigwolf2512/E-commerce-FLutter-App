import 'package:flutter/material.dart';

class WidgetBasePage extends StatelessWidget {
  const WidgetBasePage(
      {Key? key,
      this.flexibleWidget,
      required this.title,
      this.child,
      this.titleWidget})
      : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? flexibleWidget;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        flexibleSpace: flexibleWidget,
        title:
            titleWidget ?? Text(title, style: TextStyle(color: Colors.black)),
      ),
      body: child,
    );
  }
}
