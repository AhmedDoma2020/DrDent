import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingDot extends StatelessWidget {
  final bool active;

  OnBoardingDot({this.active=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 3.w
      ),
      child: Container(
        height: active? 6.h : 6.h,
        width:  active? 24.h : 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: active? kCActiveDot:kCActiveDot.withOpacity(0.16),
        ),
      ),
    );
  }
}
