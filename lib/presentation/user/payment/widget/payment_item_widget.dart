import 'package:flutter/material.dart';

import '../../../../../data/controller/cart_controller.dart';
import '../../../../../share/constant/constant.dart';

class items extends StatelessWidget {
  final int index;
  const items({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: size.height * 0.27,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.deepPurple,
              image: DecorationImage(
                image: NetworkImage(''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
