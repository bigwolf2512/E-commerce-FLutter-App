import 'package:ecommerceshop/data/controller/manage_product_controller.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/presentation/feature_shared/home/components/title_widget.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:ecommerceshop/share/widget/widget_custom_text_field.dart';
import 'package:ecommerceshop/share/widget/widget_image_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../share/widget/widget_dialog_helper.dart';

class ManageProductDetailScreen extends StatefulWidget {
  const ManageProductDetailScreen(
      {super.key, required this.data, this.isAddProduct = false});
  final ProductModel data;
  final bool isAddProduct;
  @override
  State<ManageProductDetailScreen> createState() =>
      _ManageProductDetailScreenState();
}

class _ManageProductDetailScreenState extends State<ManageProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.isAddProduct ? 'Add Product' : widget.data.name,
      ),
      body: GetBuilder<ManageProductController>(
        init: Get.find<ManageProductController>(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  CustomTextFieldWidget(
                    title: 'Name',
                    hint: 'Name',
                    text: widget.data.name,
                  ),
                  CustomTextFieldWidget(
                    title: 'Description',
                    hint: 'Description',
                    text: widget.data.description,
                  ),
                  CustomTextFieldWidget(
                      title: 'Quantity sold',
                      hint: 'Quantity sold',
                      text: '${widget.data.quantity ?? ''}'),
                  CustomTextFieldWidget(
                    title: 'Quantity total',
                    hint: 'Quantity total',
                    text: '${widget.data.totalQuantity ?? ''}',
                  ),
                  TitleWidget(title: 'Images', showSeeMore: false),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 12),
                        child: CustomNetworkImageWidget(
                          height: 0.1.h,
                          width: 0.1.h,
                          product: widget.data,
                          borderRadius: 16,
                          isList: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: InkWell(
                          onTap: () async {
                            final path =
                                await DialogHelper.imagePickerSelections(
                                    context);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                                height: 0.08.h,
                                width: 0.08.h,
                                color: Colors.white,
                                child: Center(child: Icon(Icons.add))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      minWidth: 0.8.w,
                      color: kPrimaryColor,
                      onPressed: widget.isAddProduct
                          ? () async {
                              await controller.onAddProduct(context);
                            }
                          : () {},
                      child: Text(
                        widget.isAddProduct ? "Add Product" : "Update Product",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
