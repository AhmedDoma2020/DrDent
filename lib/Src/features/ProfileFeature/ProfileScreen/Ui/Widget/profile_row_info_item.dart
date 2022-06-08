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
  final String title;
  final VoidCallback onTap;

  const ProfileRowInfoItem({
    required this.icon,
    required this.num,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68.h,
        width: 98.w,
        // padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(color: kCGreyBorder, width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconForm(
              icon: icon,
              backGroundColor: kCGreySemiDark2,
              heightAndWidthContainer: 24,
              heightAndWidthIcon: 14,
            ),
            10.0.ESW(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    // color: Colors.amber,
                    width: 38.w,
                    height: 20.h,
                    child: FittedBox(
                      child: CustomText(
                  text: title.tr,
                  fontSize: 10,
                  fontW: FW.semicond,
                ),
                    )),
                4.0.ESH(),
                SizedBox(
                  width: 38.w,
                  height: 14.h,
                  // color: Colors.red,
                  child: FittedBox(
                    child: CustomText(
                      text: num,
                      fontSize: 10,
                      fontW: FW.regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
