import 'package:flutter/material.dart';

class signupBackground extends StatelessWidget {
  final Widget child;
  const signupBackground({
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
              child: Image.asset("assets/images/signup_top.png",
                  width: size.width * 0.3)),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width * 0.5,
              )),
          child,
        ],
      ),
    );
  }
}
