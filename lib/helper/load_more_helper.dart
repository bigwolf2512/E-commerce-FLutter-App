import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/load_more_controller.dart';
import '../design/extension/double_extension.dart';
import '../share/widget/loading_indicator.dart';

abstract class LoadMoreStatefulHelper<T, Screen extends StatefulWidget>
    extends State<Screen> {
  LoadMoreStatefulHelper({Key? key});

  LoadMoreController<T> init();

  Widget itemBuilder(T data);

  LoadMoreConfig? loadMoreConfig() => null;

  List<T> _data = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _data = await init().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return loadMoreConfig() != null
        ? SizedBox(
            height: loadMoreConfig()!.size.height,
            width: loadMoreConfig()!.size.width,
            child: GetBuilder<LoadMoreController<T>>(
                init: init(),
                builder: (controller) {
                  if (_data.isEmpty) {
                    return OnLoadingIndicator();
                  }
                  return ListView.builder(
                      shrinkWrap: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: _data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8),
                          child: itemBuilder(_data[i]),
                        );
                      });
                }),
          )
        : GetBuilder<LoadMoreController<T>>(
            init: init(),
            builder: (controller) {
              if (controller.data.isEmpty) return OnLoadingIndicator();
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                  if (controller.isLoading) {
                    return OnLoadingIndicator();
                  }
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      scrollDirection: loadMoreConfig()!.scrollDirection,
                      itemCount: controller.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, right: 8),
                          child: itemBuilder(controller.data[i]),
                        );
                      });
                }),
          )
        : SizedBox(
            height: 0.88.h,
            width: double.maxFinite,
            child: GetBuilder<LoadMoreController<T>>(
                init: init(),
                builder: (controller) {
                  if (controller.data.isEmpty) return OnLoadingIndicator();
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8),
                          child: itemBuilder(controller.data[i]),
                        );
                      });
                }),
          );
  }
}

class LoadMoreConfig {
  final Axis scrollDirection;
  final Size size;
  final bool shrinkWrap;

  LoadMoreConfig({
    this.scrollDirection = Axis.horizontal,
    this.size = const Size(double.maxFinite, 100),
    this.shrinkWrap = true,
  });
}
