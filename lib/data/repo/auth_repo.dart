import 'package:shared_preferences/shared_preferences.dart';

import '../constant/path_collection.dart';
import '../firebase/firebase_curd_core.dart';
import '../model/user_model.dart';

class AuthRepo extends FirebaseCRUDCore<UserModel> {
  AuthRepo(this.sharedPreferences) : super(pathCollection: kPathCollectionUser);

  final SharedPreferences sharedPreferences;

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
