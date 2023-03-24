import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/firebase/firebase_curd_core.dart';
import 'package:ecommerceshop/data/model/product_model.dart';

class ProductRepo extends FirebaseCRUDCore {
  ProductRepo() : super(pathCollection: kPathCollectionProduct);

  @override
  fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
