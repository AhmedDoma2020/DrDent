import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/bloc/controller/work_time_controller.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/day_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_title_row.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
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
        builder: (_) =>  ListView(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 32.0.h
              ),
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
                  ),
                  32.0.ESH(),
                  IconTitleRow(title: 'ساعات العمل',icon: 'hours.png',),
                ],
              ),
            ),
            _.status != RequestStatus.done?
            0.0.ESH():
            ListView.separated(
                itemBuilder: (context, index) => DayWidget(
                  day: _.days[index],
                  onExpand: (){_.expandDay(dayIndex: index);},
                  onAddTime: (p0) {},
                  onDelete:  (p0) {},
                  onEdit:    (p0) {},
                ),
                separatorBuilder: (context, index) => 24.0.ESH(),
                itemCount: _.days.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
