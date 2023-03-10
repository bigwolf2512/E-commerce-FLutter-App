import 'package:flutter/widgets.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/product_model.dart';
import '../../../helper/load_more_helper.dart';

class ListStoreWidget extends LoadMoreHelper<ProductModel> {
  const ListStoreWidget({Key? key}) : super(key: key);

  @override
  LoadMoreController<ProductModel> init() {
    return LoadMoreController(
        id: '',
        pathCollection: kPathCollectionProduct,
        fromJson: (json) => ProductModel.fromJson(json));
  }

  @override
  Widget itemBuilder(ProductModel data) {
    return Text(data.name ?? "");
  }
}
