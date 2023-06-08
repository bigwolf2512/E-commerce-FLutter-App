import 'package:ecommerceshop/data/repo/auth_repo.dart';
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
}
