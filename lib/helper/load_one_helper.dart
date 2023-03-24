import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/load_one_controller.dart';
import '../share/widget/widget_loading_indicator.dart';

abstract class LoadOneHelper<T> extends StatelessWidget {
  const LoadOneHelper({Key? key}) : super(key: key);

  LoadOneController<T> init();
  Widget buildUI(T data);
  T fromJson(Map<String, dynamic> json);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadOneController<T>>(
        init: init(),
        builder: (c) {
          if (c.isLoading) {
            return OnLoadingIndicator();
          } else {
            return buildUI(fromJson(c.data));
          }
        });
  }
}
