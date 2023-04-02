import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';
import '../../../share/widget/widget_dialog_helper.dart';

class SetupProductPage extends StatelessWidget {
  SetupProductPage({Key? key}) : super(key: key);

  final AuthController controller = Get.find()..initSellerInfo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<AuthController>(builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                  width: 1.0.w,
                  height: 0.1.h,
                  child: Text(
                      'NEXT, WE NEED TO KNOW ABOUT YOUR PRODUCTS ON SALE',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 0.05.w,
                          color: Colors.black)),
                ),
                SizedBox(height: 0.01.h),
                Column(
                  children: List.generate(controller.newProducts.length,
                      (indexOfNewProducts) {
                    return _buildNewProductItem(context, indexOfNewProducts);
                  }),
                ),
                SizedBox(height: 0.01.h),
                InkWell(
                  onTap: () {
                    controller.insertNewProducts();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 0.9.w,
                    height: 0.1.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29),
                      color: kPrimaryLightColor,
                    ),
                    child: Text('Click to add new product'),
                  ),
                ),
                SizedBox(height: 0.04.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    minWidth: 0.8.w,
                    color: kPrimaryColor,
                    onPressed: () {
                      controller.uploadProducts(context);
                    },
                    child: const Text(
                      "Done, Congratulation!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 0.01.h),
              ],
            );
          }),
        ),
      ),
    );
  }

  Container _buildNewProductItem(BuildContext context, int indexOfNewProduct) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 0.01.h),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: 0.9.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: kPrimaryLightColor,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildTextField(
                  hintext: "Name of your product",
                  onChanged: (p0) {
                    controller.updateProducts(
                        index: indexOfNewProduct, name: p0);
                  }),
              const SizedBox(height: 8),
              _buildTextField(
                  hintext: "Price of your product",
                  onChanged: (p0) {
                    controller.updateProducts(
                        index: indexOfNewProduct, price: num.parse(p0));
                  }),
              const SizedBox(height: 8),
              _buildTextField(
                  hintext: "Description of your product",
                  onChanged: (p0) {
                    controller.updateProducts(
                        index: indexOfNewProduct, description: p0);
                  }),
              const SizedBox(height: 8),
              _buildTextField(
                  hintext: "Total of your product",
                  onChanged: (p0) {
                    controller.updateProducts(
                        index: indexOfNewProduct, totalQuantity: num.parse(p0));
                  }),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
              Wrap(direction: Axis.horizontal, children: [
                ...List.generate(
                    controller.newProducts[indexOfNewProduct].images.length,
                    (indexOfImage) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 0.08.h,
                        width: 0.08.h,
                        color: Colors.white,
                        child: controller
                                .getImage(indexOfImage, indexOfNewProduct)
                                .isEmpty
                            ? Center(child: Icon(Icons.add))
                            : Image.file(
                                File(controller.getImage(
                                    indexOfImage, indexOfNewProduct)),
                                fit: BoxFit.fill),
                      ),
                    ),
                  );
                }),
                InkWell(
                  onTap: () async {
                    final path =
                        await DialogHelper.imagePickerSelections(context);

                    if (path != null) {
                      controller.updateProducts(
                          index: indexOfNewProduct, path: path);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
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
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildTextField(
      {required String hintext, required Function(String) onChanged}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: Colors.white,
      ),
      child: TextField(
        onChanged: (p0) {
          onChanged.call(p0);
        },
        decoration:
            InputDecoration(hintText: hintext, border: InputBorder.none),
      ),
    );
  }
}
