import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditWidget extends StatelessWidget {
  const EditWidget({
    Key? key,
    required this.onEditTap,
  }) : super(key: key);

  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEditTap,
      borderRadius: BorderRadius.circular(777.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        child: Container(
          height: 32.h,
          width: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(777.r),
            color: kCMain.withOpacity(0.08),
          ),
          child: Center(
            child: ImageIcon(
              const AssetImage("assets/icons/edit.png"),
              color: kCMain,
              size: 24.h,
            ),
          ),
        ),
      ),
    );
  }
}
