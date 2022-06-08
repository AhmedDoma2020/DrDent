import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_day_time.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'package:get/get.dart';
class DayTimeWidget extends StatelessWidget {
  final DayTimeModel dayTime;
  final VoidCallback onDelete;
  final UserTypeEnum userType;
  const DayTimeWidget({Key? key, required this.dayTime,required this.onDelete, required this.userType}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'duration_',
                  color: kCMainBlack2,
                  fontSize: 12,
                  fontW: FW.light,
                ),
                GestureDetector(
                  onTap: onDelete,
                  child: CircleAvatar(
                    radius: 12.h,
                    backgroundColor: kCMain.withOpacity(.2),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/delete.png',
                        color: kCMain,
                        height: 12.55.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            15.0.ESH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconDayTime(
                  title: 'start_time'.tr,
                  subTitle: dayTime.startTime,
                  icon: 'start.png',
                ),
                IconDayTime(
                  title: 'end_time'.tr,
                  subTitle: dayTime.endTime,
                  icon: 'end.png',
                ),
                userType != UserTypeEnum.doctor?0.0.ESW():
                IconDayTime(
                  title: 'number_of_visits'.tr,
                  subTitle: dayTime.numberOfEmergencyVisits,
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
