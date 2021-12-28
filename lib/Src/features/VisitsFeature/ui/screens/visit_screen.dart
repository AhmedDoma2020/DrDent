import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/titles/icon_row_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class VisitScreen extends StatelessWidget {
  const VisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'تفاصيل الحجز'),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                   width: 343.w,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.r),
                     color: Colors.white
                   ),
                    child:   Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 27.h
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 8.h
                            ),
                            child: Image.asset(
                              'assets/icons/personvisit.png',
                              height: 16.h,
                            ),
                          ),
                          15.0.ESW(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'رشا السيد محمد',
                                  color: kCMainBlack2,
                                  fontW: FW.bold,
                                  fontSize: 16,
                                ),
                                5.0.ESH(),
                                CustomText(
                                  text: '+400 0000 000 ',
                                  color: kCMainGrey,
                                  fontW: FW.semicond,
                                  fontSize: 14,
                                ),
                                5.0.ESH(),
                                CustomText(
                                  text: 'القسم تاني , شارع المطافي , برج الدالي , الدور 11',
                                  color: kCMainGrey,
                                  fontW: FW.semicond,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            23.0.ESH(),
            Row(
              children: [
                CustomText(
                  text: 'تفاصيل الحجز',
                  fontSize: 14,
                  fontW: FW.demi,
                  color: kCMainBlack2,
                ),
              ],
            ),
            16.0.ESH(),
            IconRoeTitleSubtitle(title: '10:00 am - 10:20 am', icon: 'visitdateicon.png', subtitle: 'الاثنين, 28 مارس,2022'),
            15.0.ESH(),
            IconRoeTitleSubtitle(title: 'تعليق من المريض', icon: 'patinetcommenticon.png', subtitle: 'هذا مثال يمكن ان يتم استبداله لاحقا'),
            15.0.ESH(),
            IconRoeTitleSubtitle(title: 'ملفات مرفوعة بواسطة المريض', icon: 'patientfilesicons.png', subtitle: 'Complete Blood Analysis , CBC'),
            15.0.ESH(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDefault(
                  width: 150,
                  title: 'قبول',
                ),
                ButtonDefault(
                  width: 150,
                  title: 'رفض',
                  titleColor: kCMain,
                  buttonColor: kCInActiveButtonColor,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
