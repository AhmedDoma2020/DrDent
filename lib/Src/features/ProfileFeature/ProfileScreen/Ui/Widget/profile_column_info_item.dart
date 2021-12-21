
import 'dart:ffi';

import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/icon_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class ProfileColumnInfoItem extends StatelessWidget {
  const ProfileColumnInfoItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final String title;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          height: 62.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color:
              kCTextFieldBackGround
            // Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconForm(icon: icon,
                    backGroundColor: Colors.white,
                    heightAndWidthContainer: 32,
                    heightAndWidthIcon: 20,),
                  16.0.ESW(),
                  CustomText(text: title.tr,fontW: FW.medium,fontSize: 14,),
                ],
              ),
              const IconForm(icon: "assets/icons/arrowForwerd.png",
                backGroundColor: Colors.white,
                heightAndWidthContainer: 24,
                heightAndWidthIcon: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
