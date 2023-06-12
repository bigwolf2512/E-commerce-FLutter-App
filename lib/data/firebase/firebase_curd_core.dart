import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseCRUDCoreBase<T> {
  Future<void> update(
      {required Map<String, dynamic> data, String id, String field});
  Future<void> create(Map<String, dynamic> data);
  Future<void> delete({String? id, String? field});
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
  Future<void> delete({String? id, String? field}) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    var documentReference = response.where(field ?? 'id', isEqualTo: id);

    final result = await documentReference.get();

    final _id = result.docs.first.id;

    DocumentReference doc = response.doc(_id);

    await doc.delete();
  }

  @override
  Future<void> update(
      {required Map<String, dynamic> data, String? id, String? field}) async {
    final CollectionReference response =
        FirebaseFirestore.instance.collection(pathCollection);
    var documentReference = response.where(field ?? 'id', isEqualTo: id);

    final result = await documentReference.get();

    final _id = result.docs.first.id;

    DocumentReference doc = response.doc(_id);

    await doc.update(data);
  }

  @override
  Future<List<T>> getAll({String? field, String? id, QueryData? query}) async {
    List<T> data = [];
    late final Query<Map<String, dynamic>> response;

    if (id != null && field != null) {
      if (query != null) {
        response = FirebaseFirestore.instance
            .collection(pathCollection)
            .limit(100)
            .orderBy(query.fieldSorbBy, descending: query.isDesc)
            .where(field, isEqualTo: id);
      } else {
        response = FirebaseFirestore.instance
            .collection(pathCollection)
            .limit(100)
            .where(field, isEqualTo: id);
      }
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

    if (documentReference.docs.isEmpty) return fromJson({});

    return fromJson(
        documentReference.docs.first.data() as Map<String, dynamic>);
  }
}

class QueryData {
  final bool isDesc;
  final String fieldSorbBy;

  QueryData({required this.isDesc, required this.fieldSorbBy});
}
