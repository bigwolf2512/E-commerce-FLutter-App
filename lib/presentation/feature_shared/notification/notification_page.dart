import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/controller/notification_controller.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../design/extension/date_time_extension.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/load_more_helper.dart';
import '../../../share/widget/widget_base_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Get.find<NotificationController>().onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetBasePage(
      backgroundColor: Colors.grey[300]!,
      title: 'Notifications',
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Notifications', style: TextStyle(color: Colors.black)),
          Row(
            children: [
              Text('See All',
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(width: 0.01.h),
              Icon(Icons.check),
            ],
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.01.h),
            NotificationView(),
          ],
        ),
      ),
    );
  }
}

class NotificationView extends LoadMore<NotificationModel> {
  NotificationView({Key? key}) : super(key: key);

  final PrefRepo repo = Get.find();

  @override
  LoadMoreController<NotificationModel> init() {
    if (repo.getCurrentUser().buyerModel != null) {
      return LoadMoreController(
        sortFieldValue: repo.getCurrentUser().buyerModel?.id,
        sortFieldName: 'buyerId',
        pathCollection: kPathCollectionNotification,
        fromJson: NotificationModel.fromJson,
      );
    }
    return LoadMoreController(
      sortFieldValue: repo.getCurrentUser().sellerModel?.id,
      sortFieldName: 'sellerId',
      pathCollection: kPathCollectionNotification,
      fromJson: NotificationModel.fromJson,
    );
  }

  @override
  Widget itemBuilder(NotificationModel data) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(left: 8),
        width: 0.8.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title ?? '',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 0.01.h),
            Text(data.description ?? ''),
            SizedBox(height: 0.01.h),
            Text('Send at: ' +
                DateTimeUtil.toDateTimeString(
                    format: 'hh:mm a', dateTime: data.sendAt)),
          ],
        ));
  }
}
