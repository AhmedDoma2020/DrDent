import 'package:dr_dent/Src/bloc/model/day_model.dart';
import 'package:dr_dent/Src/bloc/model/day_time_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/sheet_add_day_details.dart';
import 'package:dr_dent/Src/features/WorkTimeFeature/ui/widgets/sheet_select_hour.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'day_time_widget.dart';
import '/src/core/utils/extensions.dart';
import 'package:get/get.dart';

class DayWidget extends StatelessWidget {
  final bool active;
  final DayModel day;
  final VoidCallback onExpand;
  final Function(DayTimeModel) onEdit;         // time params
  final Function(DayTimeModel) onDelete;       // time params
  final Function(int) onAddTime;               // day id params

  const DayWidget({Key? key,
    this.active=true,
    required this.day,
    required this.onExpand,
    required this.onEdit,
    required this.onDelete,
    required this.onAddTime
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onExpand();
      },
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.symmetric(
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
                    fontW: FW.semibold,                   // semicond
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined,color: kCGreyBorder,size: 25.sp,),
                ],
              ),
              day.expanded?
              Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.only(
                       top:  16.0.h
                   ),
                   child: ListView.separated(
                     itemBuilder: (context, index) =>  DayTimeWidget(dayTime: day.times![index],),
                     separatorBuilder: (context, index) => 16.0.ESH(),
                     itemCount: day.times!.length,
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(
                       top:  16.0.h
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       GestureDetector(
                         onTap: (){
                           print("open sheet");
                           Get.bottomSheet(
                             SheetAddDayDetails(onSave: (start,end,visitsCount){
                               print(start);
                               print(end);
                               print(visitsCount);
                             },),
                               // SheetSelectHour(),
                             isScrollControlled: true
                           );
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             color: Colors.transparent,
                             border: Border.all(color: kCMain,width: 1),
                             borderRadius: BorderRadius.circular(5.r),
                           ),
                           child: Padding(
                             padding:  EdgeInsets.symmetric(
                               vertical: 9.h,
                               horizontal: 21.w
                             ),
                             child: Center(
                               child: CustomText(
                                 text: 'إضافة فترة',
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
                 ),
               ],
             )
              :0.0.ESH()
            ],
          ),
        ),
      ),
    );
  }
}
