import 'package:ecommerceshop/data/model/buyer_model.dart';
import 'package:ecommerceshop/data/model/order_model.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/data/repo/order_repo.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/feature_shared/home/home_screen.dart';
import 'package:ecommerceshop/share/widget/widget_snack_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

enum OrderStatusEnum {
  onPrepare,
  onDelivery,
  onReceived;

  const OrderStatusEnum();

  String get getStatus {
    switch (this) {
      case OrderStatusEnum.onPrepare:
        return 'Preparing';
      case OrderStatusEnum.onDelivery:
        return 'Delivering';
      case OrderStatusEnum.onReceived:
        return 'Received';
    }
  }
}

class OrderController extends GetxController {
  OrderController(this.orderRepo, this.prefRepo);

  final OrderRepo orderRepo;
  final PrefRepo prefRepo;

  var buyer = BuyerModel();
  var products = <ProductModel>[];

  onInitBuyerData(
      {required BuyerModel buyer, required List<ProductModel> products}) {
    this.buyer = buyer;
    this.products = products;
  }

  onChangeBuyInfo({String? name, String? phone, String? address}) {
    buyer = buyer.copyWith(
      name: name ?? buyer.name,
      phoneNumber: phone ?? buyer.phoneNumber,
      address: address ?? buyer.address,
    );
  }

  onCreateOrder(BuildContext context) async {
    if (buyer.name == null ||
        buyer.phoneNumber == null ||
        buyer.address == null) return;

    final futures = <Future>[];

    for (final item in products) {
      futures.add(orderRepo.create(OrderModel(
        id: Get.find<Uuid>().v1(),
        product: item,
        buyerId: prefRepo.getCurrentUserId(),
        buyer: prefRepo.getCurrentUser().buyerModel,
        sellerId: item.sellerId,
        seller: item.seller,
        boughtDate: DateTime.now(),
      ).toJson()));
    }

    await Future.wait(futures).then((_) {
      Push.to(context, const HomePage());
      SnackBarHelper.showSnackBar(context, title: 'Create Order Success');
    });
  }
}
