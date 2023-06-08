import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/controller/product_controller.dart';
import '../../../data/model/product_model.dart';
import '../../../data/model/seller_model.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/load_more_helper.dart';
import '../../../helper/navigator_helper.dart';
import '../../../share/constant/constant.dart';
import 'product_detail/product_detail_screen.dart';

class ListProductsByStoreIdWidget extends StatefulWidget {
  const ListProductsByStoreIdWidget({Key? key, required this.sellerModel})
      : super(key: key);
  final SellerModel sellerModel;

  @override
  State<ListProductsByStoreIdWidget> createState() =>
      _ListProductsByStoreIdWidgetState();
}

class _ListProductsByStoreIdWidgetState
    extends LoadMoreStatefulHelper<ProductModel, ListProductsByStoreIdWidget> {
  @override
  LoadMoreController<ProductModel> init() {
    return LoadMoreController(
        sortFieldValue: widget.sellerModel.id,
        sortFieldName: 'sellerId',
        pathCollection: kPathCollectionProduct,
        fromJson: (json) => ProductModel.fromJson(json));
  }

  @override
  Widget itemBuilder(ProductModel data) {
    return InkWell(
      onTap: () {
        Push.noBottomBar(context, ProductDetail(data.id ?? ''));
      },
      child: Stack(
        children: [
          GetBuilder<ProductController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CustomNetworkImageWidget(
                  height: 0.15.h,
                  width: 0.4.w,
                  borderRadius: 16,
                  product: data,
                ),
              );
            },
          ),
          Positioned(
            left: 24,
            top: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: data.name,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          backgroundColor: kSecondaryColor)),
                ])),
                Text.rich(
                  TextSpan(
                    children: const [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: kSecondaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoadMoreConfig? loadMoreConfig() {
    return LoadMoreConfig(
        size: Size(double.maxFinite, 0.15.h), scrollDirection: Axis.horizontal);
  }
}
