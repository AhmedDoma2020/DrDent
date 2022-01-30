import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/day_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_title_row.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WorkTimeScreen extends StatelessWidget {

  final int workspaceId;
  final int doctorId;
  final VoidCallback onSuccess;
  const WorkTimeScreen({Key? key,required this.workspaceId, required this.doctorId,required this.onSuccess}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WorkTimeController(workSpaceId: workspaceId,doctorId: doctorId));
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'مواعيد العمل'),
      body: GetBuilder<WorkTimeController>(
        builder: (_) =>  Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 32.0.h
                  ),
                  child: Form(
                    key: _.globalKey,
                    child: Column(
                      children: [
                        IconTitleRow(title: 'ضبط اعدادات العمل',icon: 'work_time.png',),
                        15.0.ESH(),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(
                              Center(
                                child: Container(
                                  width: 343.w,
                                  height: 200.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(
                                        vertical: 16.0.h
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              CustomText(
                                                text: 'اختر نوع استقبال الحجوزات',
                                                color: kCMainBlack2,
                                                fontSize: 13,
                                                fontW: FW.semibold,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap:(){
                                                 _.dayBookingType=0;
                                                 Get.back();
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        vertical: 10.h,
                                                        horizontal: 16.w
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        CustomText(
                                                          text: 'قبول الحجوزات ف نفس اليوم',
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
                                                onTap:(){
                                                  _.dayBookingType=1;
                                                  Get.back();
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.transparent,
                                                  child: Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        vertical: 10.h,
                                                        horizontal: 16.w
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        CustomText(
                                                          text: 'قبول الحجوزات قبلها بيوم',
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
                                    )
                                  ),
                                ),
                              ),
                            );
                          },
                          child: TextFieldDefault(
                            hint: 'استقبال الحجوزات',
                            enable: false,
                            errorText: 'يجب اختيار نوع استقبال الحجوزات',
                            horizentalPadding: 0,
                            suffixIconData: Icons.keyboard_arrow_down_outlined,
                            controller: _.dayBookingController,
                          ),
                        ),
                        15.0.ESH(),
                        TextFieldDefault(
                          hint: 'مدة الكشف',
                          errorText: 'يجب ادخال مدة الكشف',
                          horizentalPadding: 0,
                          controller: _.detectionTime,
                        ),
                        32.0.ESH(),
                        IconTitleRow(title: 'ساعات العمل',icon: 'hours.png',),
                      ],
                    ),
                  ),
                ),
                _.status != RequestStatus.done?
                0.0.ESH():
                ListView.separated(
                    itemBuilder: (context, index) => Padding(
                      padding:  EdgeInsets.only(
                        bottom: index == _.days.length-1 ? 16.h : 0
                      ),
                      child: DayWidget(
                        day: _.days[index],
                        onExpand: (){_.expandDay(dayIndex: index);},
                        onAddTime: (dayTime) {
                          Get.back();
                          _.addDayTime(dayId: _.days[index].id,dayTime: dayTime);
                        },
                        onDelete:  (id) {
                            _.deleteDayTime(dayTimeId: id,dayId: _.days[index].id);
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
                    title: 'حفظ',
                    onTap: (){
                      _.addDayTimeDetails(onSuccess: onSuccess);
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
