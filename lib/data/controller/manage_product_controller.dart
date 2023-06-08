import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/data/repo/product_repo.dart';
import 'package:ecommerceshop/share/widget/widget_loading_indicator.dart';
import 'package:ecommerceshop/share/widget/widget_snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ManageProductController extends GetxController {
  ManageProductController(this.productRepo, this.prefRepo);
  final ProductRepo productRepo;
  final PrefRepo prefRepo;

  List<ProductModel> newProducts = [];

  ProductModel addProductModel = ProductModel();

  onChangedData(
      String? name, String? description, int? quantity, int? totalQuantity) {
    addProductModel = addProductModel.copyWith(
      name: name ?? addProductModel.name,
      description: description ?? addProductModel.description,
      quantity: quantity ?? addProductModel.quantity,
      totalQuantity: totalQuantity ?? addProductModel.totalQuantity,
    );
  }

  onAddProduct(BuildContext context) async {
    LoadingIndicator.show(context);
    await productRepo
        .create(addProductModel
            .copyWith(
              id: Get.find<Uuid>().v1(),
              sellerId: prefRepo.getCurrentUserId(),
              seller: prefRepo.getCurrentUser().sellerModel,
            )
            .toJson())
        .then((_) {
      SnackBarHelper.showSnackBar(context);
      LoadingIndicator.hide(context);
      Navigator.pop(context);
    });
  }
}
