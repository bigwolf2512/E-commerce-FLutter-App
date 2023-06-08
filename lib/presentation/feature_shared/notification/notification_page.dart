import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/path_collection.dart';
import '../../../data/controller/load_more_controller.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/repo/pref_repo.dart';
import '../../../design/extension/date_time_extension.dart';
import '../../../design/extension/double_extension.dart';
import '../../../helper/load_more_helper.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState
    extends LoadMoreHelper<NotificationModel, NotificationScreen> {
  final PrefRepo repo = Get.find();

  @override
  double get paddingTop => 8.0;

  @override
  double get paddingLeft => 8.0;

  @override
  double get paddingRight => 8.0;

  @override
  Widget get titleWidget => Row(
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
      );

  @override
  LoadMoreController<NotificationModel> controller() {
    if (repo.getCurrentUser().buyerModel != null) {
      return LoadMoreController(
        sortFieldValue: repo.getCurrentUser().buyerModel?.id,
        sortFieldName: 'buyerId',
        pathCollection: kPathCollectionNotification,
        fromJson: NotificationModel.fromJson,
      )..onInit();
    }
    return LoadMoreController(
      sortFieldValue: repo.getCurrentUser().sellerModel?.id,
      sortFieldName: 'sellerId',
      pathCollection: kPathCollectionNotification,
      fromJson: NotificationModel.fromJson,
    )..onInit();
  }

  @override
  Widget itemBuilder(NotificationModel data) {
    return Container(
        padding: const EdgeInsets.all(12),
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
            data.sendAt != null
                ? Text('Send at: ' +
                    DateTimeUtil.toDateTimeString(
                        format: 'hh:mm a', dateTime: data.sendAt))
                : const SizedBox(height: 8),
          ],
        ));
  }
}
