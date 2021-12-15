import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'day_time_widget.dart';
import '/src/core/utils/extensions.dart';

class DayWidget extends StatelessWidget {
  final bool active;


  const DayWidget({Key? key,this.active=true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: 'الاحد',
                  fontSize: 14,
                  color: kCMainBlack2,
                  fontW: FW.semibold,                   // semicond
                ),
                Icon(Icons.keyboard_arrow_down_outlined,color: kCGreyBorder,size: 25.sp,),
              ],
            ),
            active?
            Column(
             children: [
               Padding(
                 padding:  EdgeInsets.only(
                     top:  16.0.h
                 ),
                 child: ListView.separated(
                   itemBuilder: (context, index) =>  DayTimeWidget(),
                   separatorBuilder: (context, index) => 16.0.ESH(),
                   itemCount: 3,
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
                     Text('sdhj'),
                   ],
                 ),
               ),
             ],
           )
            :0.0.ESH()
          ],
        ),
      ),
    );
  }
}
