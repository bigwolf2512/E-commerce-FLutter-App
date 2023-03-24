import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FirebaseStorageCore {
  static Future<String> getFileUrl(String path) async {
    final ref = FirebaseStorage.instance.ref().child('images').child(path);
    var url = await ref.getDownloadURL();
    return url;
  }

  static Future uploadFile(
      {required String? parentPath, required String? path}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'tunt.developer@gmail.com', password: 'Tunt0912394945');

    if (path != null && parentPath != null) {
      final File file = File(path);
      debugPrint(file.uri.toString());
      debugPrint((await file.exists()).toString());
      final ref =
          FirebaseStorage.instance.ref().child('images/$parentPath/$path');

      return await ref.putFile(file);
    }
  }
}
