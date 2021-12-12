import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';



class IconTitleSubtitle extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subtitle;


  const IconTitleSubtitle({Key? key, this.icon, this.title='', this.subtitle=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 264.5.w,
      child: Column(
        children: [
          icon!=null?
          Image.asset(
            'assets/icons/$icon',
            height: 113.83.h,
          ):
          0.0.ESH(),
          27.0.ESH(),
          CustomText(
            text: title,
            fontW: FW.regular,   // TODO convert font type to demi
            fontSize: 16,
            color: kCMainBlack,
          ),
          CustomText(
            text: subtitle,
            textAlign: TextAlign.center,
            fontW: FW.regular,
            fontSize: 12,
            color: kCMainBlack,
          ),
        ],
      ),
    );
  }
}
