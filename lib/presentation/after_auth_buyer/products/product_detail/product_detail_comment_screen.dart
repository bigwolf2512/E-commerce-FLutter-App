import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/comment_model.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/design/extension/date_time_extension.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailCommentScreen extends StatefulWidget {
  const ProductDetailCommentScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailCommentScreen> createState() =>
      _ProductDetailCommentScreenState();
}

class _ProductDetailCommentScreenState
    extends LoadMoreHelper<CommentModel, ProductDetailCommentScreen> {
  final tedController = TextEditingController();
  final focusNode = FocusNode();

  @override
  String get title => 'Comment';
  @override
  LoadMoreController<CommentModel> controller() {
    return LoadMoreController(
      sortFieldName: 'productId',
      sortFieldValue: widget.product.id,
      pathCollection: kPathCollectionComment,
      fromJson: CommentModel.fromJson,
    );
  }

  @override
  Widget get upperChild => Column(
        children: [
          CustomNetworkImageFromProductWidget(
            height: 200,
            width: double.infinity,
            product: widget.product,
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      focusNode.requestFocus();
                    },
                    child: Text("Comment")),
                const Icon(
                    CupertinoIcons.square_fill_line_vertical_square_fill),
                Text("Share"),
              ],
            ),
          ),
        ],
      );

  @override
  Widget get underChild => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 80,
          width: double.maxFinite,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: 60,
                width: 300,
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1)),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: tedController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Text('Send',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: Colors.white))),
              ),
            ],
          ),
        ),
      );
  @override
  double get paddingTop => 260;

  @override
  Widget itemBuilder(CommentModel data) {
    return Container(
        padding: const EdgeInsets.all(16),
        width: 0.8.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.userName ?? '',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 0.01.h),
            Text(data.comment ?? ''),
            SizedBox(height: 0.01.h),
            data.createdAt != null
                ? Text('Send at: ' +
                    DateTimeUtil.toDateTimeString(
                        format: 'hh:mm a', dateTime: data.createdAt))
                : const SizedBox(height: 8),
          ],
        ));
  }
}
