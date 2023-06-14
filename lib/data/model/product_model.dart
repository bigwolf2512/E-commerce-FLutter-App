import 'package:ecommerceshop/data/firebase/firebase_storage_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';
import 'seller_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    String? id,
    String? name,
    num? price,
    String? description,
    num? quantity,
    num? totalQuantity,
    String? status,
    @Default(<ImageModel>[]) List<ImageModel> images,
    String? sellerId,
    SellerModel? seller,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? chatId,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}

extension ProductModelExtension on ProductModel {
  Future<String> getFirstImage() async {
    if (images.isEmpty) return '';
    final path = images.first.path;
    final firebasePath = await FirebaseStorageCore.getFileUrl(path: path);
    return firebasePath;
  }

  Future<List<String>> getImages() async {
    if (images.isEmpty) return [];

    final futures = <Future<String>>[];

    for (final item in images) {
      futures.add(FirebaseStorageCore.getFileUrl(path: item.path));
    }

    final result = await Future.wait(futures);

    return result;
  }
}
