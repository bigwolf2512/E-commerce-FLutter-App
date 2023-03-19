import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/constant/path_collection.dart';
import '../../data/controller/load_more_controller.dart';
import '../../data/model/buyer_model.dart';
import '../../data/model/chat_model.dart';
import '../../data/model/seller_model.dart';
import '../../data/repo/pref_repo.dart';
import '../../helper/load_more_helper.dart';

class ChatScreen extends LoadMoreStatelessHelper<ChatModel> {
  ChatScreen({Key? key}) : super(key: key);

  final PrefRepo repo = Get.find();

  String id = '';

  @override
  LoadMoreController<ChatModel> init() {
    final currentUser = repo.getCurrentUser();

    if (currentUser is SellerModel) {
      id = currentUser.sellerModel?.id ?? '';
    } else if (currentUser is BuyerModel) {
      id = currentUser.buyerModel?.id ?? '';
    }

    return LoadMoreController(
      id: id,
      field: 'userId',
      pathCollection: kPathCollectionChat,
      fromJson: ChatModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(ChatModel data) {
    return Text((data.userId ?? '') + '///' + (data.chatterId ?? ''));
  }
}
