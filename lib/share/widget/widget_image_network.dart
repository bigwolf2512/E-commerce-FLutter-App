import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomNetworkImageWidget extends StatefulWidget {
  const CustomNetworkImageWidget(
      {Key? key,
      required this.product,
      this.height,
      this.width,
      this.borderRadius = 0,
      this.child = const SizedBox()})
      : super(key: key);

  final ProductModel product;
  final double? height;
  final double? width;
  final Widget child;
  final double borderRadius;

  @override
  State<CustomNetworkImageWidget> createState() =>
      _CustomNetworkImageWidgetState();
}

class _CustomNetworkImageWidgetState extends State<CustomNetworkImageWidget> {
  final image = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      image.value = await widget.product.getFirstImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: image,
        builder: (_, data, __) {
          if (data.isEmpty) {
            return SizedBox(
              height: widget.height ?? 0.3.w,
              width: widget.width ?? 0.3.w,
              child: OnLoadingIndicator(),
            );
          }
          return Container(
            height: widget.height ?? 0.3.w,
            width: widget.width ?? 0.3.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: kSecondaryColor),
            child: widget.child,
          );
        });
  }
}
