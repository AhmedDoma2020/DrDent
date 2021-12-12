import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class DialogPasswordSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 343.w,
          height: 350.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: Colors.white
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 32.h
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/passwordok.png',
                  height: 105.7.h,
                ),
                35.0.ESH(),
                CustomText(
                  text: 'تم تغير كلمة المرور بنجاح',
                  color: kCMainBlack,
                  fontW: FW.bold,
                  fontSize: 16,
                ),
                33.0.ESH(),
                ButtonDefault(
                  width: 253,
                  title: 'العودة للتسجيل',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
