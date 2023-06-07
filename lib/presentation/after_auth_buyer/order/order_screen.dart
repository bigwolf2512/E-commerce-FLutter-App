import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/order_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:ecommerceshop/presentation/after_auth_buyer/order/widget/order_item_widget.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Order',
      ),
      body: Stack(
        children: const [
          _OrderListBuilder(),
        ],
      ),
    );
  }
}

class _OrderListBuilder extends StatefulWidget {
  const _OrderListBuilder();

  @override
  State<_OrderListBuilder> createState() => _OrderListBuilderState();
}

class _OrderListBuilderState
    extends LoadMoreStatefulHelper<OrderModel, _OrderListBuilder> {
  final PrefRepo repo = Get.find();
  String? userId;

  @override
  void initState() {
    super.initState();
    final currentUser = repo.getCurrentUser();

    userId = currentUser.buyerModel?.id ?? '';
  }

  @override
  Widget get widgetEmpty => Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/order.jpg',
          ),
        ],
      ));

  @override
  LoadMoreController<OrderModel> init() {
    return LoadMoreController(
      sortFieldName: 'userId',
      sortFieldValue: userId,
      pathCollection: kPathCollectionOrder,
      fromJson: OrderModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(OrderModel data) {
    return OrderItemWidget(data: data);
  }
}
