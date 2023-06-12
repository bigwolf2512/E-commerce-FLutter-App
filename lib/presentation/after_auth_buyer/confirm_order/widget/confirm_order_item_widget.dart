import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product_model.dart';
import '../../../../design/extension/double_extension.dart';
import '../../../../share/constant/constant.dart';

class ConfirmOrderItemWidget extends StatelessWidget {
  const ConfirmOrderItemWidget({Key? key, required this.data})
      : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 0.1.h,
        color: Colors.white,
        child: Row(
          children: [
            CustomNetworkImageFromProductWidget(
              height: 0.08.h,
              width: 0.08.h,
              borderRadius: 16,
              product: data,
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
                        children: [
                          Text(
                            data.name ?? '',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 0.022.h,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: '\$${data.price!}',
                                      style: TextStyle(
                                          fontSize: 0.022.h,
                                          color: kAccentColor)),
                                  TextSpan(
                                      text: ' for',
                                      style: TextStyle(
                                          fontSize: 0.02.h, color: kTextColor)),
                                  TextSpan(
                                      text: ' ${data.quantity!} ',
                                      style: TextStyle(
                                          fontSize: 0.022.h,
                                          color: kAccentColor)),
                                  TextSpan(
                                      text: 'items',
                                      style: TextStyle(
                                          fontSize: 0.022.h, color: kTextColor))
                                ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.01.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Provided by ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: data.seller?.storeName ??
                                        data.seller?.name ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
