import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/load_more_controller.dart';
import '../share/widget/loading_indicator.dart';

abstract class LoadMoreStatefulHelper<T, Screen extends StatefulWidget>
    extends State<Screen> {
  LoadMoreStatefulHelper({Key? key});

  LoadMoreController<T> init();

  Widget itemBuilder(T data);

  LoadMoreConfig? loadMoreConfig() => null;

  @override
  Widget build(BuildContext context) {
    return loadMoreConfig() != null
        ? SizedBox(
            height: loadMoreConfig()!.size.height,
            width: loadMoreConfig()!.size.width,
            child: GetBuilder<LoadMoreController<T>>(
                init: init(),
                builder: (controller) {
                  if (controller.data.isEmpty) {
                    return OnLoadingIndicator();
                  }
                  return ListView.builder(
                      scrollDirection: loadMoreConfig()!.scrollDirection,
                      itemCount: controller.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8),
                          child: itemBuilder(controller.data[i]),
                        );
                      });
                }),
          )
        : GetBuilder<LoadMoreController<T>>(
            init: init(),
            builder: (controller) {
              if (controller.data.isEmpty) return OnLoadingIndicator();
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.data.length,
                  itemBuilder: (c, i) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                      child: itemBuilder(controller.data[i]),
                    );
                  });
            });
  }
}

abstract class LoadMoreStatelessHelper<T> extends StatelessWidget {
  const LoadMoreStatelessHelper({Key? key}) : super(key: key);

  LoadMoreController<T> init();

  Widget itemBuilder(T data);

  LoadMoreConfig? loadMoreConfig() => null;

  @override
  Widget build(BuildContext context) {
    return loadMoreConfig() != null
        ? SizedBox(
            height: loadMoreConfig()!.size.height,
            width: loadMoreConfig()!.size.width,
            child: GetBuilder<LoadMoreController<T>>(
                init: init(),
                builder: (controller) {
                  if (controller.data.isEmpty) {
                    return OnLoadingIndicator();
                  }
                  return ListView.builder(
                      scrollDirection: loadMoreConfig()!.scrollDirection,
                      itemCount: controller.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8),
                          child: itemBuilder(controller.data[i]),
                        );
                      });
                }),
          )
        : GetBuilder<LoadMoreController<T>>(
            init: init(),
            builder: (controller) {
              if (controller.data.isEmpty) return OnLoadingIndicator();
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.data.length,
                  itemBuilder: (c, i) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                      child: itemBuilder(controller.data[i]),
                    );
                  });
            });
  }
}

class LoadMoreConfig {
  final Axis scrollDirection;
  final Size size;

  LoadMoreConfig(
      {this.scrollDirection = Axis.horizontal,
      this.size = const Size(double.maxFinite, 100)});
}
