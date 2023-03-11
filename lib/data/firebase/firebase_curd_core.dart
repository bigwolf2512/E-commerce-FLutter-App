import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCRUDCoreBase<T> {
  Future<void> update(Map<String, dynamic> data, String id);
  Future<void> create(Map<String, dynamic> data);
  Future<void> delete(String id);
  Future<List<T>> getAll();
  Future<T> getOne(String id);
}

abstract class FirebaseCRUDCore<T> extends FirebaseCRUDCoreBase {
  FirebaseCRUDCore({required this.pathCollection});

  final String pathCollection;

  T fromJson(Map<String, dynamic> json);

  @override
  Future<void> create(Map<String, dynamic> data) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    await response.add(data);
  }

  @override
  Future<void> delete(String id) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    DocumentReference documentReference = response.doc(id);

    await documentReference.delete();
  }

  @override
  Future<void> update(Map<String, dynamic> data, String? id) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    var documentReference = response.where('id', isEqualTo: id);

    final result = await documentReference.get();

    final _id = result.docs.first.id;

    DocumentReference doc = response.doc(_id);

    await doc.update(data);
  }

  @override
  Future<List<T>> getAll({String? field, String? id}) async {
    List<T> data = [];
    late final Query<Map<String, dynamic>> response;

    if (id != null && field != null) {
      response = FirebaseFirestore.instance
          .collection(pathCollection)
          .limit(100)
          .where(field, isEqualTo: id);
    } else {
      response =
          FirebaseFirestore.instance.collection(pathCollection).limit(100);
    }

    final snapShot = await response.get();

    for (var element in snapShot.docs) {
      data.add(fromJson(element.data()));
    }

    return data;
  }

  @override
  Future<T> getOne(String id) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    var documentReference =
        await response.where('id', isEqualTo: id).snapshots().first;
    return fromJson(
        documentReference.docs.first.data() as Map<String, dynamic>);
  }
}
