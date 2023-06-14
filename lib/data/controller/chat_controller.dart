import 'package:ecommerceshop/data/model/chat_model.dart';
import 'package:ecommerceshop/data/model/message_model.dart';
import 'package:ecommerceshop/data/model/product_model.dart';
import 'package:ecommerceshop/data/repo/pref_repo.dart';
import 'package:ecommerceshop/data/repo/product_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  ChatController(this.prefRepo, this.productRepo);

  final DatabaseReference _messagesRef = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://e-commerce-app-68f28-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .ref()
      .child('messages');

  final DatabaseReference _chatsRef = FirebaseDatabase.instanceFor(
          app: Firebase.app(),
          databaseURL:
              'https://e-commerce-app-68f28-default-rtdb.asia-southeast1.firebasedatabase.app/')
      .ref()
      .child('chats');

  final PrefRepo prefRepo;
  final ProductRepo productRepo;

  int get chatTotal => 0;

  Query getMessageQuery(String path) => _messagesRef.child(path);
  Query get getChatQuery => _chatsRef;

  Future<void> onSend({
    required String message,
    required String? memberId,
    required String? chatId,
    String? productId,
  }) async {
    if (message.isEmpty || memberId == null) return;
    final chats = await _chatsRef.get();

    if (productId != null) {
      final ProductModel productGetOne = await productRepo.getOne(productId);
      final _chatIdGenerate = Get.find<Uuid>().v1();
      final _chatId = chatId ?? productGetOne.chatId ?? _chatIdGenerate;

      if (_chatId == _chatIdGenerate) {
        await productRepo.update(
            field: 'id',
            id: productId,
            data: productGetOne.copyWith(chatId: _chatId).toJson());
      }

      for (var element in chats.children) {
        if ((element.value as Map<Object?, Object?>)['chatId'] == _chatId) {}
      }

      try {
        final result = chats.children.firstWhere((element) =>
            (element.value as Map<Object?, Object?>)['chatId'] == _chatId);
        await _chatsRef.child(result.key.toString()).update(ChatModel(
              memberId: memberId,
              userId: prefRepo.getCurrentUserId(),
              chatId: chatId,
              lastMessage: message,
            ).toJson());
      } catch (e) {
        await _chatsRef.push().set(ChatModel(
              memberId: memberId,
              userId: prefRepo.getCurrentUserId(),
              chatId: _chatId,
              lastMessage: message,
            ).toJson());
      }

      await _messagesRef.child(_chatId).push().set(
            MessageModel(
              id: Get.find<Uuid>().v1(),
              message: message,
              createdAt: DateTime.now(),
              sendByBuyer: !prefRepo.isCurrentSeller(),
              sentAt: DateTime.now(),
            ).toJson(),
          );
      return;
    }

    try {
      final result = chats.children.firstWhere((element) =>
          (element.value as Map<Object?, Object?>)['chatId'] == chatId);
      await _chatsRef.child(result.key.toString()).update(ChatModel(
            memberId: memberId,
            userId: prefRepo.getCurrentUserId(),
            chatId: chatId,
            lastMessage: message,
          ).toJson());
    } catch (e) {
      await _chatsRef.push().set(ChatModel(
            memberId: memberId,
            userId: prefRepo.getCurrentUserId(),
            chatId: chatId,
            lastMessage: message,
          ).toJson());
    }
    await _messagesRef.child(chatId!).push().set(
          MessageModel(
            id: Get.find<Uuid>().v1(),
            message: message,
            createdAt: DateTime.now(),
            sendByBuyer: !prefRepo.isCurrentSeller(),
            sentAt: DateTime.now(),
          ).toJson(),
        );
  }
}
