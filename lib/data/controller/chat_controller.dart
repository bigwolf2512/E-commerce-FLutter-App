import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/data/repo/chat_repo.dart';
import 'package:ecommerceshop/data/repo/message_repo.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController(this.chatRepo, this.messageRepo);

  final ChatRepo chatRepo;
  final MessageRepo messageRepo;

  Future<void> onSend(String message, String? chatId) async {
    if (message.isEmpty || chatId == null) return;

    await messageRepo.create(
      MessageModel(
        chatId: chatId,
        message: message,
        createdAt: DateTime.now(),
        isUserMessage: true,
      ).toJson(),
    );
  }
}
