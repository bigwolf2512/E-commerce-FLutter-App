import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/after_auth_seller/manage_product/manage_product_detail_screen.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProductScreen extends StatefulWidget {
  const ManageProductScreen({super.key});

  @override
  State<ManageProductScreen> createState() => _ManageProductScreenState();
}

class _ManageProductScreenState
    extends LoadMoreHelper<ProductModel, ManageProductScreen> {
  final prefRepo = Get.find<PrefRepo>();

  @override
  Color get backgroundColor => appBackgroundColor;

  @override
  Widget? get titleWidget => Row(
        children: const [
          Text(
            'Manage Product',
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
        ],
      );

  @override
  LoadMoreController<ProductModel> controller() {
    return LoadMoreController(
      sortFieldValue: prefRepo.getCurrentUserId(),
      sortFieldName: 'sellerId',
      pathCollection: kPathCollectionProduct,
      fromJson: ProductModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(ProductModel data) {
    return InkWell(
      onTap: () {
        Push.noBottomBar(context, ManageProductDetailScreen(data: data));
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
              product: data,
            ),
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
                            data.name ?? '',
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
                          SizedBox(height: 0.025.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Quantity sold: ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: '12',
                                    style: TextStyle(
                                        fontSize: 0.022.h, color: kAccentColor),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: 'Quantity total: ',
                                    style: TextStyle(
                                        fontSize: 0.02.h, color: kTextColor),
                                  ),
                                  TextSpan(
                                    text: '233',
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
