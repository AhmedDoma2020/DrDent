import 'package:dr_dent/Src/bloc/model/day_model.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/sheet_add_day_details.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';
import 'day_time_widget.dart';

class DayWidget extends StatelessWidget {
  final bool active;
  final DayModel day;
  final VoidCallback onExpand;
  final Function(DayTimeModel) onEdit; // time params
  final Function(DayTimeModel) onAddTime; // time params
  final Function(int) onDelete; //
  final UserTypeEnum userType;

  // ay id params

  const DayWidget(
      {Key? key,
      this.active = true,
      required this.day,
      required this.onExpand,
      required this.onEdit,
      required this.onDelete,
        required this.userType,
        required this.onAddTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        onExpand();
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: day.title,
                    fontSize: 14,
                    color: kCMainBlack2,
                    fontW: FW.semibold, // semicond
                  ),
                  Icon(
                    day.expanded
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: day.expanded ? kCMain : kCGreyBorder,
                    size: 25.sp,
                  ),
                ],
              ),
              day.expanded
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.0.h),
                          child: ListView.separated(
                            itemBuilder: (context, index) => DayTimeWidget(
                              userType: userType,
                              dayTime: day.times![index],
                              onDelete: () {
                                onDelete(day.times![index].id);
                              },
                            ),
                            separatorBuilder: (context, index) => 16.0.ESH(),
                            itemCount: day.times!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                          ),
                        ),
                        userType == UserTypeEnum.doctor?
                        Padding(
                          padding: EdgeInsets.only(top: 16.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  debugPrint("open sheet");
                                  Get.bottomSheet(SheetAddDayDetails(
                                    userType: userType,
                                    onSave: (start, end, visitsCount) {
                                      debugPrint(start);
                                      debugPrint(end);
                                      debugPrint(visitsCount);
                                      DayTimeModel dayTimeModel = DayTimeModel(
                                        id: 0,
                                        startTime: start,
                                        endTime: end,
                                        numberOfEmergencyVisits: visitsCount,
                                      );
                                      node.unfocus();
                                      onAddTime(dayTimeModel);
                                    },
                                  ),
                                      // SheetSelectHour(),
                                      isScrollControlled: true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: kCMain, width: 1),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 9.h, horizontal: 21.w),
                                    child: Center(
                                      child: CustomText(
                                        text: 'إضافة  فترة',
                                        color: kCMain,
                                        fontW: FW.medium,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ):
                        day.times!.isNotEmpty?
                            0.0.ESH():
                             Padding(
                          padding: EdgeInsets.only(top: 16.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  debugPrint("open sheet");
                                  Get.bottomSheet(SheetAddDayDetails(
                                    userType: userType,
                                    onSave: (start, end, visitsCount) {
                                      debugPrint(start);
                                      debugPrint(end);
                                      debugPrint(visitsCount);
                                      DayTimeModel dayTimeModel = DayTimeModel(
                                        id: 0,
                                        startTime: start,
                                        endTime: end,
                                        numberOfEmergencyVisits: visitsCount,
                                      );
                                      node.unfocus();
                                      onAddTime(dayTimeModel);
                                    },
                                  ),
                                      // SheetSelectHour(),
                                      isScrollControlled: true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: kCMain, width: 1),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 9.h, horizontal: 21.w),
                                    child: Center(
                                      child: CustomText(
                                        text: 'إضافة  فترة',
                                        color: kCMain,
                                        fontW: FW.medium,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : 0.0.ESH()
            ],
          ),
        ),
      ),
    );
  }
}
