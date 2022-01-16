import 'package:flutter/material.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardOfAccountType extends StatelessWidget {
  const CardOfAccountType({
    Key? key,
    this.isSelected = false,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final bool isSelected;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 151.w,
      decoration: BoxDecoration(
        color: isSelected ? kCSubMain : Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          width: 1,
          color: kCTFEnableBorder,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 66.w,
          // height: 110.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 55.w,
                height: 55.w,
                child: Image.asset(
                  icon,
                  width: 55.w,
                  height: 55.w,
                  fit: BoxFit.fill,
                ),
              ),
              10.0.ESH(),
              CustomText(
                text: title.tr,
                fontW: FW.semibold,
                fontSize: 14,
                color: isSelected ? Colors.white : kCBlackTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
