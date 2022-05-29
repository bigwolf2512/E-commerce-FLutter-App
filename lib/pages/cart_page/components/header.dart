import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_const/app_const.dart';

class buildAppBarDetail extends StatefulWidget {
  const buildAppBarDetail({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<buildAppBarDetail> createState() => _buildAppBarDetailState();
}

class _buildAppBarDetailState extends State<buildAppBarDetail> {
  bool allChecked = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        return Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: widget.size.width * 0.1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: widget.size.height * 0.01),
                      Text(
                        'Your Cart',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('${cartController.lengthCart} products',
                          style: Theme.of(context).textTheme.caption)
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
                    onChanged: (bool? value) {
                      setState(
                        () {
                          allChecked = value!;
                          cartController.setSelectedAll(allChecked);
                        },
                      );
                      cartController.selectedPrice;
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
