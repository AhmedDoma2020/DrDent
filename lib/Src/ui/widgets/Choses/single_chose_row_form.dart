import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SingleChoseRowForm extends StatelessWidget {
  final String title;
  final bool isSelected;
  // final  VoidCallback  onSelectTap;
  const SingleChoseRowForm({
    required this.title,
    required this.isSelected,
    // required this.onSelectTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.amber,
            height: 40.h,
            width: 280.w,
            child: FittedBox(
              child: CustomText(
                textAlign: TextAlign.start,
                text: title,
                fontW: FW.semibold,
                fontSize: 24.sp,
                maxLines: 1,
              ),
            ),
            //192.168.0.105
            //192.168.0.105:5555
          ),
          Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
              color: isSelected == false ? Colors.transparent : kCSubMain,
              borderRadius: BorderRadius.circular(777.r),
              border: Border.all(
                  width: 2.w,
                  color: isSelected != false
                      ? Colors.transparent
                      : kCMainGrey),
            ),
            child: isSelected == false
                ? 0.0.ESH()
                : Icon(
              Icons.check,
              size: 14.w,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
