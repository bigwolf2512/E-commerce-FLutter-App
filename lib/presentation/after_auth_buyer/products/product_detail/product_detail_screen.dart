import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/constant/path_collection.dart';
import '../../../../data/controller/cart_controller.dart';
import '../../../../data/controller/load_one_controller.dart';
import '../../../../data/controller/product_controller.dart';
import '../../../../data/model/product_model.dart';
import '../../../../design/extension/double_extension.dart';
import '../../../../helper/load_one_helper.dart';
import '../../../../share/constant/constant.dart';
import '../../../../share/widget/widget_button_flat.dart';
import 'widget/description_page_view.dart';

class ProductDetail extends LoadOneHelper<ProductModel> {
  const ProductDetail(this.id, {Key? key}) : super(key: key);
  final String id;

  @override
  Widget buildUI(ProductModel data) {
    return _ProductDetailScreen(data: data);
  }

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }

  @override
  LoadOneController<ProductModel> init() {
    return LoadOneController(pathCollection: kPathCollectionProduct, id: id);
  }
}

class _ProductDetailScreen extends StatefulWidget {
  const _ProductDetailScreen({Key? key, required this.data}) : super(key: key);
  final ProductModel data;

  @override
  State<_ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<_ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: SizedBox(
          height: 1.0.h,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildAppBarAndProductImage(context),
              ),
              Positioned(
                top: 0.28.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildFavoriteIconAndInfo(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0.1.h,
                child: _buildQuantityAdjust(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityAdjust() {
    return Container(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        height: 0.15.h,
        width: 1.0.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: kSecondaryColor,
        ),
        child: GetBuilder<CartController>(builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 0.06.h,
                  width: 0.55.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  '\$ ${(widget.data.price ?? 0) * controller.quantity}',
                              style:
                                  TextStyle(fontSize: 20, color: kAccentColor)),
                          TextSpan(
                              text: ' for ',
                              style:
                                  TextStyle(fontSize: 16, color: kTextColor)),
                          TextSpan(
                              text: controller.quantity.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: kAccentColor)),
                          TextSpan(
                              text: ' items',
                              style: TextStyle(fontSize: 16, color: kTextColor))
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 0.06.h,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => controller.addQuantity(false),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            color: kAccentColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 0.05.w),
                    InkWell(
                      onTap: () => controller.addQuantity(true),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: kAccentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }

  Container _buildBottomBar() {
    return Container(
      height: 0.15.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.3),
          )
        ],
      ),
      child: Container(
        height: 0.1.h,
        width: 0.5.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.3),
            )
          ],
        ),
        // ignore: deprecated_member_use
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<CartController>(
              builder: (controller) => InkWell(
                onTap: () {
                  controller.addProductToCart(widget.data, context);
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 12),
                  height: 0.09.h,
                  width: 0.45.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryColor),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: true ? 'Add To Cart' : '${0} | Add More',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 0.09.h,
              width: 0.45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kPrimaryColor),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 0.001.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Check Out',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_sharp, color: Colors.white)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildFavoriteIconAndInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      width: double.maxFinite,
      height: 0.4.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.3),
          )
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
                text: widget.data.name, style: const TextStyle(fontSize: 20)),
          ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                  height: 0.06.h,
                  width: 0.2.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: Colors.red[100]),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: Colors.redAccent,
                    ),
                  )),
            ],
          ),
          SizedBox(height: 0.01.h),
          Container(
            height: 0.45.h,
            padding: const EdgeInsets.only(right: 20),
            child: DescriptionPageView(text: ''),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarAndProductImage(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return CustomNetworkImageWidget(
          height: 0.3.h,
          width: double.maxFinite,
          product: widget.data,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ButtonFlat(
                    itemsNumber: 0,
                    icon: Icon(CupertinoIcons.back),
                    padding: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 0.13.w,
                    width: 0.2.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(children: const [
                          TextSpan(
                              text: '4.5',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor)),
                        ])),
                        SvgPicture.asset('assets/icons/Star Icon.svg'),
                      ],
                    ))
              ],
            ),
          ));
    });
  }
}
