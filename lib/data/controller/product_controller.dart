import 'package:ecommerceshop/data/firebase/firebase_storage_core.dart';
import 'package:ecommerceshop/data/repo/auth_repo.dart';
import 'package:ecommerceshop/design/extension/object_extension.dart';
import 'package:get/get.dart';

import '../model/seller_model.dart';
import '../repo/pref_repo.dart';

class ProductController extends GetxController {
  ProductController(this.sellerRepo, this.buyerRepo, this.prefRepo);

  final SellerAuthRepo sellerRepo;
  final BuyerAuthRepo buyerRepo;
  final PrefRepo prefRepo;

  SellerModel? sellerModel;

  @override
  void onInit() async {
    super.onInit();
    sellerModel = await sellerRepo
        .getOne(prefRepo.getCurrentUser().sellerModel?.id ?? '');
    update();
  }

  String image = '';

  getImage(String? path) async {
    path.log();
    String _path = await FirebaseStorageCore.getFileUrl(path: path);
    image = _path;
    update();
  }
}
