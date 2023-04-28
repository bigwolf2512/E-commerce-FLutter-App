import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_spref.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../design/extension/double_extension.dart';
import '../../../share/widget/widget_loading_indicator.dart';
import 'components/dashboard_app_bar.dart';
import 'components/list_store_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final PrefRepo repo;

  @override
  void initState() {
    super.initState();
    repo = Get.find<PrefRepo>();
  }

  @override
  Widget build(BuildContext context) {
    if (repo.sharedPreferences.containsKey(kPathPrefUser)) {
      if (repo.isCurrentSeller()) {
        return SingleChildScrollView(
          child: Column(
            children: [
              DashBoardAppBar(),
              _buildDiscount(),
              OwnStoreWidget(),
            ],
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              DashBoardAppBar(),
              _buildDiscount(),
              ListStoreWidget(),
            ],
          ),
        );
      }
    }
    return OnLoadingIndicator();
  }

  Widget _buildDiscount() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 0.15.h,
      width: 0.95.w,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: const [
            TextSpan(
              text: "A Summer Surpise\n",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
