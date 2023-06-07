import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, this.title, this.titleWidget})
      : super(key: key);

  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title ?? '',
            style: TextStyle(color: Colors.black),
          ),
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.maxFinite, 60);
}
