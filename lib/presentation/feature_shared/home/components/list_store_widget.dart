import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/constant/path_collection.dart';
import '../../../../data/controller/load_more_controller.dart';
import '../../../../data/controller/load_one_controller.dart';
import '../../../../data/model/seller_model.dart';
import '../../../../helper/load_more_helper.dart';
import '../../../../helper/load_one_helper.dart';
import '../../../after_auth_buyer/products/list_product_by_storeid_widget.dart';
import 'title_widget.dart';

class ListStoreWidget extends LoadMoreStatelessHelper<SellerModel> {
  const ListStoreWidget({Key? key}) : super(key: key);

  @override
  LoadMoreController<SellerModel> init() {
    return LoadMoreController(
      pathCollection: kPathCollectionSeller,
      fromJson: SellerModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(SellerModel data) {
    return ((data.productOnSale ?? []).isNotEmpty)
        ? Column(
            children: [
              TitleWidget(title: data.storeName ?? data.name ?? ''),
              ListProductsByStoreIdWidget(sellerModel: data)
            ],
          )
        : const SizedBox();
  }
}

class OwnStoreWidget extends LoadOneHelper<SellerModel> {
  OwnStoreWidget({Key? key}) : super(key: key);

  final PrefRepo repo = Get.find();

  @override
  Widget buildUI(SellerModel data) {
    return Column(
      children: [
        TitleWidget(title: data.storeName),
        ListProductsByStoreIdWidget(sellerModel: data)
      ],
    );
  }

  @override
  SellerModel fromJson(Map<String, dynamic> json) {
    return SellerModel.fromJson(json);
  }

  @override
  LoadOneController<SellerModel> init() {
    return LoadOneController(
        pathCollection: kPathCollectionSeller,
        id: repo.getCurrentUser().sellerModel?.id);
  }
}
