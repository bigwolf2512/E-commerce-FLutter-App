import 'package:ecommerceshop/data/constant/path_collection.dart';
import 'package:ecommerceshop/data/controller/chat_controller.dart';
import 'package:ecommerceshop/data/controller/load_more_controller.dart';
import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/helper/load_more_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(this.chatId, {Key? key}) : super(key: key);

  final String? chatId;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends LoadMoreHelper<MessageModel, MessageScreen> {
  final tedController = TextEditingController();

  @override
  double get paddingBottom => 80;

  @override
  String get title => 'Message';

  @override
  LoadMoreController<MessageModel> controller() {
    return LoadMoreController(
      sortFieldValue: widget.chatId,
      sortFieldName: 'chatId',
      pathCollection: kPathCollectionMessage,
      fromJson: MessageModel.fromJson,
    );
  }

  @override
  Widget get child => Align(
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
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(width: 1)),
                child: TextFormField(
                  controller: tedController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () {
                  Get.find<ChatController>()
                      .onSend(tedController.text, widget.chatId)
                      .then((_) {
                    tedController.clear();
                    sController.jumpTo(sController.position.maxScrollExtent);
                  });
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: Text('Send',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: Colors.white))),
              ),
            ],
          ),
        ),
      );

  @override
  Widget itemBuilder(MessageModel data) {
    return Align(
      alignment:
          data.isUserMessage ? Alignment.centerLeft : Alignment.centerRight,
      child: data.isUserMessage
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      data.message ?? '',
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                data.message ?? '',
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
    );
  }
}
