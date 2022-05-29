import 'package:ecommerceshop/data/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_const/app_const.dart';
import '../../../route_helper/route_helper.dart';

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
                  GestureDetector(
                    onTap: () => RouteHelper().getPersonalPage(context),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: widget.size.height * 0.05,
                      width: widget.size.height * 0.05,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://scontent.fsgn5-12.fna.fbcdn.net/v/t39.30808-6/275626876_3076796902573541_8189424536756048255_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=3S5z9NyLBRwAX8a56GW&_nc_ht=scontent.fsgn5-12.fna&oh=00_AT_f_rHLj0ww3eh6a2JMhTdtvQ5KMVl6xImUL-seIduR4A&oe=62991911'),
                              fit: BoxFit.cover)),
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
