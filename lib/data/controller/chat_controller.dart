import 'package:ecommerceshop/data/model/chat_model.dart';
import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/data/repo/chat_repo.dart';
import 'package:ecommerceshop/data/repo/message_repo.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController(this.chatRepo, this.messageRepo, this.prefRepo);

  final ChatRepo chatRepo;
  final MessageRepo messageRepo;
  final PrefRepo prefRepo;

  List<ChatModel> _chats = [];
  List<ChatModel> get chats => _chats;

  int get chatTotal => chats.length;

  @override
  void onInit() async {
    super.onInit();

    String id = prefRepo.getCurrentUser().buyerModel?.id ?? '';

    await chatRepo.getAll(id: id, field: 'userId').then((value) {
      _chats = value;
      update();
    });
    update();
  }

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
