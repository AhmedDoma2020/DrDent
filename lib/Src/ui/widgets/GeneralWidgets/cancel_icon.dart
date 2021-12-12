import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelIcon extends StatelessWidget {
  final VoidCallback onTap;

  CancelIcon({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(777.r),
          color: kCMain.withOpacity(0.10),
        ),
        child: Icon(Icons.close,color: kCMain,size: 20.w,),
      ),
    );
  }
}
