import 'package:flutter/material.dart';

class WidgetBasePage extends StatelessWidget {
  const WidgetBasePage({
    Key? key,
    this.flexibleWidget,
    required this.title,
    this.child,
    this.titleWidget,
    this.appBarBackgroundColor = Colors.white,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? flexibleWidget;
  final Widget? child;
  final Color appBarBackgroundColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: appBarBackgroundColor,
        flexibleSpace: flexibleWidget,
        title:
            titleWidget ?? Text(title, style: TextStyle(color: Colors.black)),
      ),
      body: child,
    );
  }
}
