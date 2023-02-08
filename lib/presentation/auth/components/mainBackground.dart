import 'package:flutter/material.dart';

class mainBackground extends StatelessWidget {
  final Widget child;
  const mainBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      height: size.height,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset("assets/images/main_top.png",
                  width: size.width * 0.3)),
          Positioned(
              left: 0,
              bottom: 0,
              child: Image.asset("assets/images/main_bottom.png")),
          child,
        ],
      ),
    );
  }
}
