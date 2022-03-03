import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../bloc/models/notification_model.dart';
import '/src/core/utils/extensions.dart';


class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({Key? key,required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 16.0.w
      ),
      child: Container(
         width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: ImageNetwork(
                width: 40.w,
                height: 40.w,
                url: notification.image
              ),
            ),
            16.0.ESW(),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: notification.title,
                      fontW: FW.light,
                      fontSize: 10,
                      color: kCMainGrey,
                    ),
                    6.0.ESH(),
                    CustomText(
                      text: notification.subtitle,
                      fontW: FW.light,
                      fontSize: 14,
                      color: kCMainBlack2,
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
