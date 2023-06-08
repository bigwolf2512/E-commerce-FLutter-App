import 'package:ecommerceshop/data/controller/order_controller.dart';
import 'package:ecommerceshop/presentation/feature_shared/home/components/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOrderWidget extends StatelessWidget {
  const HomeOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: 'Your order recently'),
        Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            children: [
              _OrderItemWidget(status: OrderStatusEnum.onPrepare.getStatus),
              _OrderItemWidget(status: OrderStatusEnum.onDelivery.getStatus),
              _OrderItemWidget(status: OrderStatusEnum.onReceived.getStatus),
            ],
          ),
        ),
      ],
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(status,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              'Customer: Nguyen Thanh Tu',
              style: context.textTheme.titleMedium,
            ),
            Spacer(),
            Text('Sach x 1'),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Address: HCM',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
