import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LoadOneController<T> extends GetxController {
  LoadOneController({required this.pathCollection, required this.id});
  final String id;
  final String pathCollection;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  getOne() async {
    _isLoading = true;
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    var documentReference = await response
        .where('id', isEqualTo: id)
        .snapshots()
        .first
        .whenComplete(() => _isLoading = false);

    _data = documentReference.docs.first.data() as Map<String, dynamic>;
    update();
  }
}
