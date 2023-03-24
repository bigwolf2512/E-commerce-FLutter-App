import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../helper/load_more_helper.dart';
import '../../../share/widget/widget_base_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetBasePage(
      title: 'Notifications',
      child: SizedBox.expand(
        child: NotificationView(),
      ),
    );
  }
}

class NotificationView extends LoadMoreStatelessHelper<NotificationModel> {
  NotificationView({Key? key}) : super(key: key);

  final PrefRepo repo = Get.find();
  @override
  LoadMoreController<NotificationModel> init() {
    return LoadMoreController(
      id: repo.getCurrentUser().buyerModel?.id,
      field: 'buyerId',
      pathCollection: kPathCollectionNotification,
      fromJson: NotificationModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(NotificationModel data) {
    return Text(data.title ?? '');
  }
}
