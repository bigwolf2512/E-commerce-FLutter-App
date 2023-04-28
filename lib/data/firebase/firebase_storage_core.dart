import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseStorageCore {
  static Future<String> getFileUrl({
    required String? path,
  }) async {
    final ref = FirebaseStorage.instance.ref().child('$path');
    var url = await ref.getDownloadURL();
    return url;
  }

  static uploadImagePath(
      {required String? localPath,
      required String? firebaseStoragePath}) async {
    if (localPath == null || firebaseStoragePath == null) return;

    final File file = File(localPath);
    debugPrint(file.uri.toString());
    debugPrint((await file.exists()).toString());
    final ref = FirebaseStorage.instance.ref().child(firebaseStoragePath);

    return await ref.putFile(file);
  }
}
