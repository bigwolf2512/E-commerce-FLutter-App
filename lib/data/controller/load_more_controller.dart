import 'package:get/get.dart';

import '../firebase/firebase_curd_core.dart';

class LoadMoreController<T> extends GetxController {
  LoadMoreController({
    this.sortFieldValue,
    this.sortFieldName,
    required this.pathCollection,
    required this.fromJson,
    this.queryData,
  }) {
    try {
      isLoading = true;
      initController();
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
    }
  }
  bool isLoading = false;
  final String? sortFieldValue;
  final String? sortFieldName;
  final String pathCollection;
  final T Function(Map<String, dynamic> json) fromJson;
  late final LoadMoreRepo<T> repo;
  final QueryData? queryData;

  Future<void> initController() async {
    repo = LoadMoreRepo<T>(
        pathCollection: pathCollection, fromJsonFunction: fromJson);
    await getAll();
    update();
  }

  List<T> _data = [];
  List<T> get data => _data;

  Future<List<T>> getAll() async {
    if (sortFieldValue != null) {
      _data = await repo.getAll(
          id: sortFieldValue, field: sortFieldName ?? 'id', query: queryData);
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
