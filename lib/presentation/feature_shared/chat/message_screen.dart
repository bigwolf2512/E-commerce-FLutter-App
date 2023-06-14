import 'package:ecommerceshop/data/controller/chat_controller.dart';
import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/message_item_widget.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:ecommerceshop/share/widget/widget_appbar.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key, required this.memberId, this.chatId, this.productId});

  final String? memberId;
  final String? chatId;
  final String? productId;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _scrollController = ScrollController();
  final _tedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(title: 'Message'),
        body: Stack(
          children: [
            FirebaseAnimatedList(
              controller: _scrollController,
              query: controller.getMessageQuery,
              itemBuilder: (context, snapshot, animation, index) {
                final result = snapshot.value as Map<Object?, Object?>;
                Map<String, dynamic> map = {};
                result.forEach((key, value) {
                  map.putIfAbsent(key.toString(), () => value);
                });
                final message = MessageModel.fromJson(map);
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: MessageWidget(data: message),
                );
              },
            ),
            Align(
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 1)),
                      child: TextFormField(
                        controller: _tedController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Get.find<ChatController>()
                            .onSend(
                          message: _tedController.text,
                          chatId: widget.chatId,
                          memberId: widget.memberId,
                          productId: widget.productId,
                        )
                            .then((_) {
                          _tedController.clear();
                          _scrollController.jumpTo(
                              _scrollController.position.maxScrollExtent);
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kPrimaryColor),
                          child: Text('Send',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
