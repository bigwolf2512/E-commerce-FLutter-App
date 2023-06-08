import 'package:ecommerceshop/data/controller/manage_product_controller.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/design/extension/double_extension.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
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
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                CustomTextFieldWidget(
                  hint: 'Name',
                  text: widget.data.name,
                ),
                CustomTextFieldWidget(
                  hint: 'Description',
                  text: widget.data.description,
                ),
                CustomTextFieldWidget(
                  hint: 'Quantity sold',
                  text: '12',
                ),
                CustomTextFieldWidget(
                  hint: 'Quantity total',
                  text: '22',
                ),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: InkWell(
                        onTap: () async {
                          final path =
                              await DialogHelper.imagePickerSelections(context);
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
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    this.onChanged,
    this.hint = '',
    this.text = '',
  });

  final Function(String)? onChanged;
  final String hint;
  final String? text;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  void initState() {
    super.initState();
    tedController.text = widget.text ?? '';
  }

  final tedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: appBackgroundColor,
        ),
        child: TextField(
            controller: tedController,
            decoration: InputDecoration(
                hintText: widget.hint,
                icon: Icon(Icons.person, color: kPrimaryColor),
                border: InputBorder.none),
            onChanged: (value) => widget.onChanged));
  }
}
