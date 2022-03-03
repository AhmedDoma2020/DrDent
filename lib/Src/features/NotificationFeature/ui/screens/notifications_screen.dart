import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/NotificationFeature/ui/widgets/notification_item.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../ui/widgets/Dialog/loading_dialog.dart';
import '../../bloc/controllers/notifications_controller.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'الإشعارات'),
      body: GetBuilder<NotificationsController>(
        builder: (_) =>
            _.status != RequestStatus.done?
                Center(child: Loader(),):
            ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding:  EdgeInsets.only(
                top: index==0 ? 16.h :0
              ),
              child: NotificationItem(notification: _.notifications[index]),
            ),
            separatorBuilder: (context, index) => 16.0.ESH(),
            itemCount: _.notifications.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
