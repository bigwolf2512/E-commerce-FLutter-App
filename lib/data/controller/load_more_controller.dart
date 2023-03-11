import 'package:get/get.dart';

import '../firebase/firebase_curd_core.dart';

class LoadMoreController<T> extends GetxController {
  LoadMoreController({
    this.id,
    required this.pathCollection,
    required this.fromJson,
  }) {
    initController();
  }
  final String pathCollection;
  String? id;
  final T Function(Map<String, dynamic> json) fromJson;
  late LoadMoreRepo<T> repo;

  initController() {
    repo = LoadMoreRepo<T>(
        pathCollection: pathCollection, fromJsonFunction: fromJson);
    getAll();
    update();
  }

  List<T> data = [];

  getAll() async {
    if (id != null) {
      data = await repo.getAll(id: id, field: 'storeId');
    } else {
      data = await repo.getAll();
    }

    update();
  }
}

class LoadMoreRepo<T> extends FirebaseCRUDCore<T> {
  LoadMoreRepo({required String pathCollection, required this.fromJsonFunction})
      : super(pathCollection: pathCollection);

  final T Function(Map<String, dynamic> json) fromJsonFunction;

  @override
  T fromJson(Map<String, dynamic> json) {
    return fromJsonFunction.call(json);
  }
}
