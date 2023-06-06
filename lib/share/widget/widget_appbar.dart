import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
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
