import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/message_screen.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/chat_model.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../helper/load_more_helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chat'),
      body: Stack(
        children: const [
          ChatListWidget(),
        ],
      ),
    );
  }
}

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState
    extends LoadMoreStatefulHelper<ChatModel, ChatListWidget> {
  final PrefRepo repo = Get.find();
  String? id;

  @override
  void initState() {
    super.initState();
    final currentUser = repo.getCurrentUser();

    id = currentUser.buyerModel?.id ?? '';
  }

  @override
  LoadMoreController<ChatModel> init() {
    return LoadMoreController(
      id: id,
      field: 'userId',
      pathCollection: kPathCollectionChat,
      fromJson: ChatModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(ChatModel data) {
    return InkWell(
      onTap: () {
        Push.to(context, MessageScreen(data.chatId));
      },
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
                  borderRadius: BorderRadius.circular(16), color: Colors.blue),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data.memberId ?? ''),
                  Text(data.lastMessage ?? ''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
