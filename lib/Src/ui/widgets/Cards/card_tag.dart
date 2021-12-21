import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CardTag extends StatelessWidget {
  final String title;
  final Color? backGroundColor;
  
  const CardTag({Key? key,required this.title,this.backGroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: backGroundColor??kCActiveDot.withOpacity(.4)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          vertical: 3.h,
          horizontal: 6.w
        ),
        child: Center(
          child: CustomText(
            text: title,
            fontW: FW.light,
            color: kCActiveDot,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
