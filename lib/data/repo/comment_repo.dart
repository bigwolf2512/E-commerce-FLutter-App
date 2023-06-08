import 'package:ecommerceshop/data/model/comment_model.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';

class CommentRepo extends FirebaseCRUDCore<CommentModel> {
  CommentRepo() : super(pathCollection: kPathCollectionComment);

  @override
  CommentModel fromJson(Map<String, dynamic> json) {
    return CommentModel.fromJson(json);
  }
}
