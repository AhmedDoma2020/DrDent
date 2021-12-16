import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class IconDayTime extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;


  IconDayTime({this.title=' ', this.subTitle=' ', this.icon=' '});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/icons/${icon}',
          color: kCMainGrey,
          height: 13.h,
        ),
        6.0.ESW(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              color: kCMainBlack2,
              fontSize: 12,
              fontW: FW.light,
            ),
            5.0.ESH(),
            CustomText(
              text: subTitle,
              color: kCMainBlack2,
              fontSize: 12,
              fontW: FW.light,
            ),
          ],
        ),
      ],
    );
  }
}
