import 'package:ecommerceshop/data/model/message_model.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';

class MessageRepo extends FirebaseCRUDCore<MessageModel> {
  MessageRepo() : super(pathCollection: kPathCollectionMessage);

  @override
  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel.fromJson(json);
  }
}
