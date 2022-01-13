import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/day_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_title_row.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WorkTimeScreen extends StatelessWidget {



  const WorkTimeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WorkTimeController());
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
                        TextFieldDefault(
                          hint: 'استقبال الحجوزات',
                          enable: false,
                          errorText: 'يجب اختيار نوع استقبال الحجوزات',
                          horizentalPadding: 0,

                          suffixIconData: Icons.keyboard_arrow_down_outlined,
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
                          _.addDayTime(dayId: _.days[index].id,dayTime: dayTime,doctorId: 1,workSpaceId: 1);
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
                    physics: NeverScrollableScrollPhysics(),
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
                      _.addDayTimeDetails();
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
