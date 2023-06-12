import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/message_screen.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/chat_model.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../helper/load_more_helper.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends LoadMoreHelper<ChatModel, ChatScreen> {
  final PrefRepo repo = Get.find();
  String? id;

  @override
  void initState() {
    super.initState();
    final currentUser = repo.getCurrentUser();

    if (currentUser.buyerModel != null) {
      id = currentUser.buyerModel?.id ?? '';
    } else {
      id = currentUser.sellerModel?.id ?? '';
    }
  }

  @override
  String get title => 'Chat';

  @override
  LoadMoreController<ChatModel> controller() {
    return LoadMoreController(
      sortFieldValue: id,
      sortFieldName: 'userId',
      pathCollection: kPathCollectionChat,
      fromJson: ChatModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(ChatModel data) {
    return InkWell(
      onTap: () => Push.to(context, MessageScreen(data.chatId)),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          Expanded(
            child: Container(
              height: 80,
              margin: EdgeInsets.only(left: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kPrimaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.memberId ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    data.lastMessage ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
