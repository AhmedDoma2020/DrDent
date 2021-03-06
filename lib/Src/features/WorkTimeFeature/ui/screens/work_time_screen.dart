import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/day_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_title_row.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/src/core/utils/extensions.dart';

class WorkTimeScreen extends StatelessWidget {
  final int workspaceId;
  final int doctorId;
  final VoidCallback onSuccess;
  final bool isBack;
  final bool isEdit;
  final UserTypeEnum userType;
  final String fetchDetectionTime;
  final String fetchDayBooking;
  final int? dayBookingTypeEdit;

  WorkTimeScreen({
    Key? key,
    required this.workspaceId,
    this.doctorId = 0,
    required this.onSuccess,
    required this.userType,
    this.isBack = false,
    this.isEdit = false,
    this.fetchDayBooking = '',
    this.fetchDetectionTime = '',
    this.dayBookingTypeEdit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    debugPrint(" box.read('id') in WorkTimeScreen is ${ box.read('id')}");
    debugPrint("workspaceId in WorkTimeScreen is $workspaceId");
    debugPrint("doctorId in WorkTimeScreen is $doctorId");
    Get.put(WorkTimeController(workSpaceId: workspaceId,dayBookingTypeEdit:dayBookingTypeEdit, doctorId: doctorId, userType: userType,isEdit: isEdit,fetchDayBooking: fetchDayBooking,fetchDetectionTime:fetchDetectionTime ,));
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'jop_time', isBack: isBack),
      body: GetBuilder<WorkTimeController>(
        builder: (_) => Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.0.h),
                  child: Form(
                    key: _.globalKey,
                    child: Column(
                      children: [
                        userType != UserTypeEnum.doctor?0.0.ESH():
                        Column(
                          children: [
                            IconTitleRow(
                              title: 'Adjust_work_settings',
                              icon: 'work_time.png',
                            ),
                            15.0.ESH(),
                            GestureDetector(
                              onTap: () {
                                Get.dialog(
                                  Center(
                                    child: Container(
                                      width: 343.w,
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.r),
                                          color: Colors.white),
                                      child: Material(
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16.0.h),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                      text: 'Choose_the_type_of_booking_reception',
                                                      color: kCMainBlack2,
                                                      fontSize: 13,
                                                      fontW: FW.semibold,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        _.dayBookingType = 0;
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: Colors.transparent,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                              horizontal: 16.w),
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                'Accepting_same_day_reservations',
                                                                color: kCMainBlack2,
                                                                fontSize: 13,
                                                                fontW: FW.semibold,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _.dayBookingType = 1;
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        color: Colors.transparent,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                              horizontal: 16.w),
                                                          child: Row(
                                                            children: [
                                                              CustomText(
                                                                text:
                                                                'Accepting_reservations_the_day_before',
                                                                color: kCMainBlack2,
                                                                fontSize: 13,
                                                                fontW: FW.semibold,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                10.0.ESH(),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                );
                              },
                              child: TextFieldDefault(
                                hint: 'Receiving_reservations'.tr,
                                enable: false,
                                errorText: 'error_Receiving_reservations_field'.tr,
                                horizentalPadding: 0,
                                suffixIconData: Icons.keyboard_arrow_down_outlined,
                                controller: _.dayBookingController,
                              ),
                            ),
                            15.0.ESH(),
                            TextFieldDefault(
                              hint: 'Detection_time'.tr,
                              errorText: 'error_Detection_time_field'.tr,
                              keyboardType: TextInputType.datetime,
                              horizentalPadding: 0,
                              controller: _.detectionTime,
                            ),
                            32.0.ESH(),
                          ],
                        ),
                        IconTitleRow(
                          title: 'work_hours',
                          icon: 'hours.png',
                        ),
                      ],
                    ),
                  ),
                ),
                _.status != RequestStatus.done
                    ? Center(
                        child: Loader(),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              bottom: index == _.days.length - 1 ? 16.h : 0),
                          child: DayWidget(
                            userType: userType,
                            day: _.days[index],
                            onExpand: () {
                              _.expandDay(dayIndex: index);
                            },
                            onAddTime: (dayTime) {
                              Get.back();
                              _.addDayTime(
                                  dayId: _.days[index].id, dayTime: dayTime);
                            },
                            onDelete: (id) {
                              _.deleteDayTime(
                                  dayTimeId: id, dayId: _.days[index].id);
                            },
                            onEdit: (dayTime) {
                              // _.addDayTime(dayId: _.days[index].id,dayTime: dayTime);
                            },
                          ),
                        ),
                        separatorBuilder: (context, index) => 24.0.ESH(),
                        itemCount: _.days.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                100.0.ESH()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                height: 100.h,
                child: Center(
                  child: ButtonDefault(
                    title: 'save_',
                    onTap: () {
                      if (userType == UserTypeEnum.doctor) {
                        _.addDayTimeDetails(onSuccess: onSuccess);
                      } else {
                        debugPrint("ssssssssss");
                        onSuccess();
                        debugPrint("bbbbbb");
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
