import 'package:dr_dent/Src/features/NotificationFeature/ui/widgets/notification_item.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'الإشعارات'),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.only(
              top: index==0 ? 16.h :0
            ),
            child: NotificationItem(),
          ),
          separatorBuilder: (context, index) => 16.0.ESH(),
          itemCount: 30,
        shrinkWrap: true,
      ),
    );
  }
}
