import 'package:ecommerceshop/data/model/order_model.dart';
import 'package:ecommerceshop/design/extension/date_time_extension.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/share/widget/widget_image_network.dart';
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
                Expanded(
                  child: Text(
                    "Order ID: ${data.id}",
                    style: TextStyle(fontSize: 15),
                  ),
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
              children: [
                Text(
                  "Will be delivered to you on ${DateTimeUtil.toDateTimeString(format: 'hh:mm a', dateTime: data.receiveExpectDate)}",
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
              "Status: Delivering to ${data.address ?? ''}",
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
          Container(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                height: 0.15.h,
                child: Row(
                  children: [
                    CustomNetworkImageFromProductWidget(
                      height: 0.14.h,
                      width: 0.14.h,
                      borderRadius: 16,
                      product: data.product!,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Name: ${data.product?.name ?? ''}',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 0.01.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Price: \$ ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${data.product?.price ?? 0}',
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
                                  Text("Quantity: ${data.product?.quantity}"),
                                  SizedBox(height: 0.01.h),
                                  Text(
                                      "Seller: ${data.product?.seller?.storeName ?? ''}"),
                                ],
                              ),
                            ),
                            SizedBox(height: 0.025.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Total Cash: \$ ${data.totalPrice ?? 0}",
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
