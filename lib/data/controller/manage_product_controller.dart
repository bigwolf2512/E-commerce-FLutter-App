import 'package:ecommerceshop/data/model/image_model.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/data/repo/product_repo.dart';
import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/feature_shared/home/home_screen.dart';
import 'package:ecommerceshop/share/widget/widget_loading_indicator.dart';
import 'package:ecommerceshop/share/widget/widget_snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ManageProductController extends GetxController {
  ManageProductController(this.productRepo, this.prefRepo);
  final ProductRepo productRepo;
  final PrefRepo prefRepo;

  final List<ProductModel> _newProducts = [];

  ProductModel addProductModel = ProductModel();

  updateProducts({
    required int index,
    String? name,
    num? totalQuantity,
    String? description,
    num? price,
    String? path,
  }) {
    final sellerModel = prefRepo.getCurrentUser().sellerModel;
    ProductModel productModel = _newProducts[index];

    String _path = 'images/${sellerModel?.storeId}/${productModel.id}';
    String _imageId = Get.find<Uuid>().v1();

    productModel = productModel.copyWith(
      name: name ?? productModel.name,
      totalQuantity: totalQuantity ?? productModel.totalQuantity,
      price: price ?? productModel.price,
      description: description ?? description,
      images: path != null
          ? [
              ...productModel.images,
              ImageModel(
                  id: _imageId, path: '$_path/$_imageId', localPath: path)
            ]
          : [...productModel.images],
    );

    _newProducts[index] = productModel;
    update();
  }

  onChangedData({
    String? name,
    String? description,
    int? quantity,
    int? totalQuantity,
    int? price,
  }) {
    addProductModel = addProductModel.copyWith(
      name: name ?? addProductModel.name,
      description: description ?? addProductModel.description,
      quantity: quantity ?? addProductModel.quantity,
      totalQuantity: totalQuantity ?? addProductModel.totalQuantity,
      price: price ?? addProductModel.price,
    );
  }

  onAddProduct(BuildContext context) async {
    LoadingIndicator.show(context);

    addProductModel = addProductModel.copyWith(
      id: Get.find<Uuid>().v1(),
      sellerId: prefRepo.getCurrentUserId(),
      seller: prefRepo.getCurrentUser().sellerModel,
    );

    await productRepo.create(addProductModel.toJson()).then((_) {
      SnackBarHelper.showSnackBar(context);
      LoadingIndicator.hide(context);
      Push.to(context, const HomePage());
    });
  }
}
