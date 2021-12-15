import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/day_widget.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/icon_title_row.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
class WorkTimeScreen extends StatelessWidget {
  const WorkTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'مواعيد العمل'),
      body: ListView(
        children: [
          32.0.ESH(),
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
          IconTitleRow(title: 'ساعات العمل',icon: 'work_time.png',),
          32.0.ESH(),
          ListView.separated(
              itemBuilder: (context, index) => DayWidget(),
              separatorBuilder: (context, index) => 24.0.ESH(),
              itemCount: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
