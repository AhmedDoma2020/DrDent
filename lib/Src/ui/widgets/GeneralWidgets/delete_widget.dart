import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeleteWidget extends StatelessWidget {
  const DeleteWidget({
    Key? key,
    required this.onDeleteTap,
  }) : super(key: key);

  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDeleteTap,
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
              const AssetImage("assets/icons/delete.png"),
              color: kCMain,
              size: 24.h,
            ),
          ),
        ),
      ),
    );
  }
}
