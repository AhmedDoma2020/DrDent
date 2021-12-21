import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ProfileRowInfoItem extends StatelessWidget {
  final String num;
  final String icon;
  const ProfileRowInfoItem({
    required this.icon,
    required this.num,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 98.w,
      padding: EdgeInsets.symmetric(
          horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: kCGreyBorder, width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconForm(icon: icon,
          backGroundColor: kCGreyBorder,
          heightAndWidthContainer: 24,
          heightAndWidthIcon: 14,),
          10.0.ESW(),
          Column(
            children: [
              CustomText(text: "patients_".tr,fontSize: 10,fontW: FW.regular,),
              4.0.ESH(),
              CustomText(text: num,fontSize: 10,fontW: FW.regular,),
            ],
          ),
        ],
      ),
    );
  }
}

