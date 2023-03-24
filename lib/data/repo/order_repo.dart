import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';
import '../model/order_model.dart';

class OrderRepo extends FirebaseCRUDCore<OrderModel> {
  OrderRepo() : super(pathCollection: kPathCollectionOrder);

  @override
  OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel.fromJson(json);
  }
}
