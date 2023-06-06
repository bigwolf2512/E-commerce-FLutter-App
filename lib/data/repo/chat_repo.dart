import 'package:ecommerceshop/data/model/chat_model.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';

class ChatRepo extends FirebaseCRUDCore<ChatModel> {
  ChatRepo() : super(pathCollection: kPathCollectionChat);

  @override
  ChatModel fromJson(Map<String, dynamic> json) {
    return ChatModel.fromJson(json);
  }
}
