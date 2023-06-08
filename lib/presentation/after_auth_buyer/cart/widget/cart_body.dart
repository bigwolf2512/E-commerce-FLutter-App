import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../data/model/product_model.dart';
import '../../../../design/extension/double_extension.dart';
import '../../../../helper/navigator_helper.dart';
import '../../../../share/constant/constant.dart';
import '../../products/product_detail/product_detail_screen.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  void initState() {
    super.initState();
    Get.find<CartController>().initProductsInCart();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return controller.productsInCart.isEmpty
            ? Container(
                height: 1.0.h,
                width: 1.0.w,
                color: Colors.grey[350],
                child: Image.asset(
                  'assets/images/empty-cart.png',
                ))
            : SingleChildScrollView(
                child: SizedBox(
                  height: 0.7.h,
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.productsInCart.length,
                    itemBuilder: (context, index) {
                      return _buildCartItemWidget(
                          product: controller.productsInCart[index]);
                    },
                  ),
                ),
              );
      },
    );
  }

  Widget _buildCartItemWidget({required ProductModel product}) {
    return InkWell(
      onTap: () {
        Push.to(context, ProductDetailScreen(data: product));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 0.16.h,
        width: double.maxFinite,
        child: Row(
          children: [
            CustomNetworkImageWidget(
                height: 0.14.h,
                width: 0.14.h,
                borderRadius: 20,
                product: product),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? '',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 0.022.h,
                            ),
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
                                    text: product.seller?.storeName ??
                                        product.seller?.name ??
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
                    SizedBox(height: 0.025.h),
                    GetBuilder<CartController>(
                      builder: (controller) => Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: 'Price ',
                                        style: TextStyle(
                                            fontSize: 0.02.h,
                                            color: kTextColor),
                                      ),
                                      TextSpan(
                                        text: '\$${product.price}',
                                        style: TextStyle(
                                            fontSize: 0.022.h,
                                            color: kAccentColor),
                                      ),
                                      // TextSpan(
                                      //   text: ' x ',
                                      //   style: TextStyle(
                                      //       fontSize: 0.02.h, color: kTextColor),
                                      // ),
                                      // TextSpan(
                                      //   text: '${product.quantity}',
                                      //   style: TextStyle(
                                      //       fontSize: 0.022.h,
                                      //       color: kAccentColor),
                                      // ),
                                      // TextSpan(
                                      //   text: ' items',
                                      //   style: TextStyle(
                                      //       fontSize: 0.02.h, color: kTextColor),
                                      // )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(3),
                              height: 0.05.h,
                              width: 0.25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kPrimaryColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        controller.addProductToCart(
                                            product.copyWith(
                                                quantity:
                                                    (product.quantity ?? 0) -
                                                        1),
                                            context,
                                            shouldAddFromCart: false);
                                      },
                                      child: Icon(Icons.remove,
                                          color: Colors.white)),
                                  Text(
                                    '${product.quantity}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 0.022.h),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.addProductToCart(
                                          product.copyWith(
                                              quantity:
                                                  (product.quantity ?? 0)),
                                          context,
                                          shouldAddFromCart: true);
                                    },
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
