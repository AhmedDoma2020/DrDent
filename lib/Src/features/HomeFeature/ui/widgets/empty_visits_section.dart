import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class EmptyVisitsSection extends StatelessWidget {
  const EmptyVisitsSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kNCardRadius),
        color: Colors.transparent,
        border: Border.all(width: 1,color: Color(0xffD2D2D2))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/empty.png',
            height: 41.h,
          ),
          10.0.ESH(),
          CustomText(
            text: 'ليس لديك حجوزات بعد',
            fontW: FW.demi,
            fontSize: 14,
            color: kCMainBlack2,
          ),
        ],
      )
    );
  }
}
