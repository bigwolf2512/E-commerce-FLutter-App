import 'package:flutter/material.dart';

class bottom extends StatelessWidget {
  const bottom({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      height: size.height * 0.07,
      width: size.width * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.black),
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            children: const [
              TextSpan(
                text: 'Pay Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
