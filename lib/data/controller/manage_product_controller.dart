import 'package:ecommerceshop/data/firebase/firebase_storage_core.dart';
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

  ProductModel addProductModel = ProductModel();
  initData(ProductModel product) {
    if (product != ProductModel()) {
      addProductModel = product;
    }
  }

  onChangedData({
    String? name,
    String? description,
    int? quantity,
    int? totalQuantity,
    int? price,
    String? imagePath,
  }) async {
    final sellerModel = prefRepo.getCurrentUser().sellerModel;
    var image = ImageModel();

    addProductModel = addProductModel.copyWith(
      id: addProductModel.id ?? Get.find<Uuid>().v1(),
    );

    if (imagePath != null) {
      image = image.copyWith(
        id: Get.find<Uuid>().v1(),
        path: 'images/${sellerModel?.storeId}/${addProductModel.id}',
        localPath: imagePath,
      );

      await FirebaseStorageCore.uploadImagePath(
        firebaseStoragePath: image.path,
        localPath: image.localPath,
      );
    }

    addProductModel = addProductModel.copyWith(
      id: addProductModel.id ?? Get.find<Uuid>().v1(),
      sellerId: addProductModel.sellerId ?? prefRepo.getCurrentUserId(),
      seller: addProductModel.seller ?? prefRepo.getCurrentUser().sellerModel,
      name: name ?? addProductModel.name,
      description: description ?? addProductModel.description,
      quantity: quantity ?? addProductModel.quantity,
      totalQuantity: totalQuantity ?? addProductModel.totalQuantity,
      price: price ?? addProductModel.price,
      images: imagePath != null
          ? [...addProductModel.images, image]
          : addProductModel.images,
    );

    update();
  }

  onAddProduct(BuildContext context) async {
    LoadingIndicator.show(context);

    await productRepo.create(addProductModel.toJson()).then((_) {
      SnackBarHelper.showSnackBar(context);
      LoadingIndicator.hide(context);
      Push.to(context, const HomePage());
    });
  }

  onUpdateProduct(BuildContext context) async {
    LoadingIndicator.show(context);

    await productRepo.update(data: addProductModel.toJson()).then((_) {
      SnackBarHelper.showSnackBar(context);
      LoadingIndicator.hide(context);
      Push.to(context, const HomePage());
    });
  }
}
