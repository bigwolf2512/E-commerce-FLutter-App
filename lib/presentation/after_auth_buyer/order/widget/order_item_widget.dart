import 'package:ecommerceshop/data/model/order_model.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({Key? key, required this.data}) : super(key: key);

  final OrderModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order ID: ${data.id}",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Payment: By Cash",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Will be delivered to you on ${"October 3"}",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Status: Delivering to ${"Thuong Hai, Trung Quoc"}",
              style: TextStyle(fontSize: 15),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
          Column(
            children: List.generate(
              0,
              (index) => Container(
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 0.15.h,
                    child: Row(
                      children: [
                        Container(
                          height: 0.14.h,
                          width: 0.14.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(""), fit: BoxFit.cover),
                              color: kSecondaryColor),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'name',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 0.01.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Price: \$ ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: 'price',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.01.h),
                                      Text("Quantity: 0"),
                                      SizedBox(height: 0.01.h),
                                      Text("Seller Id: 0"),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.025.h),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Total Cash: \$ ${120}",
              style: TextStyle(fontSize: 15),
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
