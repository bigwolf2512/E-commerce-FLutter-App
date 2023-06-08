import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/presentation/feature_shared/home/components/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeRevenueWidget extends StatelessWidget {
  const HomeRevenueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: 'Your revenue'),
        Container(
          padding: const EdgeInsets.all(24),
          height: 0.15.h,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Your revenue today: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Your revenue last day: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Your revenue total: ',
                    style: context.textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text('1000.000'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
