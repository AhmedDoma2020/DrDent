import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_day_time.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'package:get/get.dart';
class DayTimeWidget extends StatelessWidget {
  const DayTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kNRadius),
        color: kCOffWight,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 19.h
        ),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: 'الفترة',
                  color: kCMainBlack2,
                  fontSize: 12,
                  fontW: FW.light,
                ),
              ],
            ),
            15.0.ESH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconDayTime(
                  title: 'start_time'.tr,
                  subTitle: '12:00 AM',
                  icon: 'start.png',
                ),
                IconDayTime(
                  title: 'end_time'.tr,
                  subTitle: '04:00 PM',
                  icon: 'end.png',
                ),
                IconDayTime(
                  title: 'number_of_visits'.tr,
                  subTitle: '4',
                  icon: 'group.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
