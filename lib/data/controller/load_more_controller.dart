import 'package:get/get.dart';

import '../firebase/firebase_curd_core.dart';

class LoadMoreController<T> extends GetxController {
  LoadMoreController({
    this.id,
    this.field,
    required this.pathCollection,
    required this.fromJson,
  }) {
    isLoading = true;
    initController().then((_) => isLoading = false);
    update();
  }
  bool isLoading = false;
  final String? id;
  final String? field;
  final String pathCollection;
  final T Function(Map<String, dynamic> json) fromJson;
  late final LoadMoreRepo<T> repo;

  Future<void> initController() async {
    repo = LoadMoreRepo<T>(
        pathCollection: pathCollection, fromJsonFunction: fromJson);
    await getAll();
    update();
  }

  List<T> _data = [];
  List<T> get data => _data;

  Future<List<T>> getAll() async {
    if (id != null) {
      _data = await repo.getAll(id: id, field: field ?? 'id');
    } else {
      _data = await repo.getAll();
    }
    return _data;
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
