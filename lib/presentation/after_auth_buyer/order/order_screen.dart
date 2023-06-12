import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/order_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:ecommerceshop/presentation/after_auth_buyer/order/widget/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends LoadMoreHelper<OrderModel, OrderScreen> {
  final PrefRepo repo = Get.find();

  @override
  String get title => 'Order';

  @override
  Widget itemBuilder(OrderModel data) {
    return OrderItemWidget(data: data);
  }

  @override
  LoadMoreController<OrderModel> controller() {
    return LoadMoreController(
      sortFieldName: 'buyerId',
      sortFieldValue: repo.getCurrentUserId(),
      pathCollection: kPathCollectionOrder,
      fromJson: OrderModel.fromJson,
    );
  }
}
