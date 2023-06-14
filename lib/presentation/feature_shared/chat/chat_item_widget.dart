import 'package:ecommerceshop/data/model/chat_model.dart';
import 'package:ecommerceshop/helper/navigator_helper.dart';
import 'package:ecommerceshop/presentation/feature_shared/chat/message_screen.dart';
import 'package:ecommerceshop/share/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.data});

  final ChatModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Push.to(context,
            MessageScreen(chatId: data.chatId, memberId: data.memberId));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                data.lastMessage ?? '',
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
