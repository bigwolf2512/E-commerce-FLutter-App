import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: true,
      backgroundColor: Colors.blue,
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.maxFinite, 60);
}
