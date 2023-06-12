import 'package:ecommerceshop/share/widget/widget_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/cart_controller.dart';
import '../../../../data/model/buyer_model.dart';
import '../../../../data/repo/auth_repo.dart';
import '../../../../data/repo/pref_repo.dart';
import '../../../../design/extension/double_extension.dart';
import 'confirm_order_item_widget.dart';

class ConfirmOrderBody extends StatefulWidget {
  const ConfirmOrderBody({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderBody> createState() => _ConfirmOrderBodyState();
}

class _ConfirmOrderBodyState extends State<ConfirmOrderBody> {
  final BuyerAuthRepo buyerRepo = Get.find();
  final PrefRepo prefRepo = Get.find();

  BuyerModel? buyerModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      buyerModel = await buyerRepo
          .getOne(prefRepo.getCurrentUser().buyerModel?.id ?? '');
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Container(
        height: 0.8.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check Out',
                      style: TextStyle(
                          fontSize: 0.08.w, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${controller.getTotalProductsInCart} items',
                      style: TextStyle(
                          fontSize: 0.04.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.01.h),
              CustomTextFieldWidget(title: 'Your name'),
              SizedBox(height: 0.01.h),
              CustomTextFieldWidget(title: 'Phone number'),
              SizedBox(height: 0.01.h),
              CustomTextFieldWidget(title: 'Address'),
              SizedBox(height: 0.04.h),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.8),
                    width: 1.9,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.8),
                    width: 1.9,
                  ),
                )),
                width: double.maxFinite,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.productsInCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ConfirmOrderItemWidget(
                        data: controller.productsInCart[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
