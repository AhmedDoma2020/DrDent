import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class IconRoeTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  const IconRoeTitleSubtitle({Key? key,required this.title , required this.icon,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/icons/$icon',
          height: 20.7.h,
          color: kCActiveDot,
        ),
        15.0.ESW(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontW: FW.semicond,
              color: kCGreyTitle,
              fontSize: 12,
            ),
            5.0.ESH(),
            CustomText(
              text: subtitle,
              fontW: FW.semicond,
              color: kCMainBlack2,
              fontSize: 14,
            ),
          ],
        ),
      ],
    );
  }
}
