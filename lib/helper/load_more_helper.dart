import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/load_more_controller.dart';
import '../share/widget/loading_indicator.dart';

abstract class LoadMoreHelper<T> extends StatefulWidget {
  const LoadMoreHelper({Key? key}) : super(key: key);
  LoadMoreController<T> init();
  Widget itemBuilder(T data);

  @override
  State<LoadMoreHelper<T>> createState() => _LoadMoreHelperState<T>();
}

class _LoadMoreHelperState<T> extends State<LoadMoreHelper<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: GetBuilder<LoadMoreController<T>>(
          init: widget.init(),
          builder: (controller) {
            if (controller.data.isEmpty) return OnLoadingIndicator();
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.data.length,
                itemBuilder: (c, i) {
                  return widget.itemBuilder(controller.data[i]);
                });
          }),
    );
  }
}
