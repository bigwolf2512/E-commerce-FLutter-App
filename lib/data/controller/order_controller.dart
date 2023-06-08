import 'package:get/get.dart';

enum OrderStatusEnum {
  onPrepare,
  onDelivery,
  onReceived;

  const OrderStatusEnum();

  String get getStatus {

  switch(this){

    case OrderStatusEnum.onPrepare:
      return 'Preparing';
    case OrderStatusEnum.onDelivery:
      return 'Delivering';
    case OrderStatusEnum.onReceived:
      return 'Received';
  }
  }



}

class OrderController extends GetxController {}
