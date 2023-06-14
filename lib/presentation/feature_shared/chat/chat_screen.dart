import 'package:ecommerceshop/data/controller/chat_controller.dart';
import 'package:ecommerceshop/data/model/chat_model.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/chat_item_widget.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(title: 'Chat'),
        body: FirebaseAnimatedList(
          controller: _scrollController,
          query: controller.getChatQuery,
          itemBuilder: (context, snapshot, animation, index) {
            final result = snapshot.value as Map<Object?, Object?>;
            Map<String, dynamic> map = {};
            result.forEach((key, value) {
              map.putIfAbsent(key.toString(), () => value);
            });
            final chat = ChatModel.fromJson(map);
            return Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: ChatWidget(data: chat),
            );
          },
        ),
      );
    });
  }
}
