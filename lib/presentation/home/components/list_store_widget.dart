import 'dart:math';

import 'package:flutter/material.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/seller_model.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/load_more_helper.dart';
import '../../../share/constant/constant.dart';

class ListStoreScreen extends LoadMoreStatelessHelper<SellerModel> {
  const ListStoreScreen({Key? key}) : super(key: key);

  @override
  LoadMoreController<SellerModel> init() {
    return LoadMoreController(
        pathCollection: kPathCollectionSeller, fromJson: SellerModel.fromJson);
  }

  @override
  Widget itemBuilder(SellerModel data) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          height: 0.2.h,
          width: 0.6.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage(
                    "assets/images/Image Banner 2.png",
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          left: 24,
          top: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: data.name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: kSecondaryColor)),
              ])),
              Text.rich(
                TextSpan(
                  children: const [
                    TextSpan(
                      text: "",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          backgroundColor: kSecondaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  LoadMoreConfig? loadMoreConfig() {
    return LoadMoreConfig(size: Size(double.maxFinite, 0.2.h));
  }
}
