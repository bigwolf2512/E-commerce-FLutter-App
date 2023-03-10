import 'package:flutter/material.dart';

import '../../../../share/constant/constant.dart';

class CartHeader extends StatefulWidget {
  const CartHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CartHeader> createState() => _CartHeaderState();
}

class _CartHeaderState extends State<CartHeader> {
  bool allChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: widget.size.height * 0.05,
                  width: widget.size.height * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepOrange,
                      image: DecorationImage(
                          image: NetworkImage(''), fit: BoxFit.cover)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: widget.size.height * 0.01),
                  Text(
                    'Your Cart',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('0 products', style: Theme.of(context).textTheme.caption)
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(allChecked ? 'All Selected' : 'Select All',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: widget.size.height * 0.02)),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: allChecked,
                onChanged: (bool? value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
