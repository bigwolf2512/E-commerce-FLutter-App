import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/load_more_controller.dart';
import '../design/extension/double_extension.dart';
import '../share/widget/widget_loading_indicator.dart';

abstract class LoadMoreHelper<T, Screen extends StatefulWidget>
    extends State<Screen> {
  final sController = ScrollController();

  LoadMoreHelper({Key? key});

  LoadMoreController<T> controller();

  Widget itemBuilder(T data);

  String get title => '';

  Widget get underChild => const SizedBox();
  Widget get upperChild => const SizedBox();

  Widget? get titleWidget => null;

  Color get backgroundColor => appBackgroundColor;

  double get paddingTop => 0.0;
  double get paddingBottom => 0;
  double get paddingLeft => 0;
  double get paddingRight => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(title: title, titleWidget: this.titleWidget),
      body: GetBuilder<LoadMoreController<T>>(
          init: controller(),
          builder: (controller) {
            if (controller.isLoading || controller.data.isEmpty) {
              return OnLoadingIndicator();
            }

            return Stack(
              children: [
                upperChild,
                Padding(
                  padding: EdgeInsets.only(
                    top: paddingTop,
                    bottom: paddingBottom,
                    left: paddingLeft,
                    right: paddingRight,
                  ),
                  child: ListView.builder(
                      controller: sController,
                      itemCount: controller.data.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 8, right: 8, bottom: 8),
                          child: itemBuilder(controller.data[i]),
                        );
                      }),
                ),
                underChild,
              ],
            );
          }),
    );
  }
}

abstract class LoadMoreStatefulHelper<T, Screen extends StatefulWidget>
    extends State<Screen> {
  LoadMoreStatefulHelper({Key? key});

  LoadMoreController<T> init();

  Widget itemBuilder(T data);

  LoadMoreConfig? loadMoreConfig() => null;

  double get paddingBottom => 12.0;

  Widget get widgetEmpty => const SizedBox();

  Color get backgroundColor => Colors.white;

  List<T> _data = [];

  void get onRefresh => initState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _data = [];
      _data = await init().getAll();
      if (mounted) setState(() {});
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
                  if (controller.isLoading) {
                    return OnLoadingIndicator();
                  }

                  if (controller.data.isEmpty) {
                    return widgetEmpty;
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
        : Scaffold(
            backgroundColor: backgroundColor,
            body: GetBuilder<LoadMoreController<T>>(
                init: init(),
                builder: (controller) {
                  if (controller.isLoading) {
                    return OnLoadingIndicator();
                  }

                  if (controller.data.isEmpty) {
                    return Center(child: widgetEmpty);
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      _data = [];
                      _data = await init().getAll();
                    },
                    child: ListView.builder(
                        shrinkWrap: false,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.data.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 8, bottom: 8),
                            child: itemBuilder(controller.data[i]),
                          );
                        }),
                  );
                }),
          );
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
                  if (controller.isLoading) return OnLoadingIndicator();
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
