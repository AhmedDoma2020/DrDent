import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class DayTimeWidget extends StatelessWidget {
  const DayTimeWidget({Key? key}) : super(key: key);

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
              children: [
                CustomText(
                  text: 'الفترة',
                  color: kCMainBlack2,
                  fontSize: 12,
                  fontW: FW.light,
                ),
              ],
            ),
            15.0.ESH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/delete.png',
                      color: kCMainGrey,
                      height: 13.h,
                    ),
                    6.0.ESW(),
                    Column(
                      children: [
                        CustomText(
                          text: 'بداية الفترة',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: '12:00 AM',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/delete.png',
                      color: kCMainGrey,
                      height: 13.h,
                    ),
                    6.0.ESW(),
                    Column(
                      children: [
                        CustomText(
                          text: 'بداية الفترة',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: '12:00 AM',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/delete.png',
                      color: kCMainGrey,
                      height: 13.h,
                    ),
                    6.0.ESW(),
                    Column(
                      children: [
                        CustomText(
                          text: 'بداية الفترة',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                        5.0.ESH(),
                        CustomText(
                          text: '12:00 AM',
                          color: kCMainBlack2,
                          fontSize: 12,
                          fontW: FW.light,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
