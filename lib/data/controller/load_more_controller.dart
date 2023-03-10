import 'package:get/get.dart';

import '../firebase/firebase_curd_core.dart';

class LoadMoreController<T> extends GetxController {
  LoadMoreController({
    required this.pathCollection,
    required this.id,
    required this.fromJson,
  }) {
    initController();
  }
  final String pathCollection;
  final String id;
  final T Function(Map<String, dynamic> json) fromJson;
  late LoadMoreRepo<T> repo;

  initController() {
    repo = LoadMoreRepo<T>(
        pathCollection: pathCollection, fromJsonFunction: fromJson);
    getAll();
  }

  List<T> data = [];

  getAll() async {
    data = await repo.getAll();
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
