import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/constant/path_spref.dart';
import '../../../../data/model/buyer_model.dart';
import '../../../../data/model/seller_model.dart';
import '../../../../data/repo/auth_repo.dart';
import '../../../../data/repo/pref_repo.dart';
import '../../../../helper/size_helper.dart';
import '../../../../share/widget/widget_loading_indicator.dart';
import '../../../after_auth_seller/setup_store/setup_store_page.dart';
import '../../home/home_screen.dart';
import '../welcome_screen/welcome_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PrefRepo repo = Get.find();
  final SellerAuthRepo sellerRepo = Get.find();
  final BuyerAuthRepo buyerRepo = Get.find();

  Widget? page;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      page = await getCurrentUser();
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return page ?? OnLoadingIndicator();
  }

  Future<Widget> getCurrentUser() async {
    if (repo.sharedPreferences.containsKey(kPathPrefUser)) {
      if (repo.getCurrentUser().sellerModel != null) {
        debugPrint(repo.getCurrentUser().sellerModel?.id);
        final SellerModel sellerModel = await sellerRepo
            .getOne(repo.getCurrentUser().sellerModel?.id ?? '');

        if (sellerModel.isSetupStore ?? false) {
          return SetupStoreScreen();
        }
      }
      if (repo.getCurrentUser().buyerModel != null) {
        final BuyerModel buyerModel =
            await buyerRepo.getOne(repo.getCurrentUser().buyerModel?.id ?? '');

        return HomePage();
      }
      return HomePage();
    }
    return WelcomeScreen();
  }
}
