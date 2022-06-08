import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RowOfItemDrawer extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  const RowOfItemDrawer({
    required this.onTap,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4.r),
      onTap: (){
        Get.back();
        onTap();
      },
      highlightColor: kCSubMain.withOpacity(.1),
      splashColor: kCSubMain.withOpacity(.2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          height: 42.h,
          width: double.infinity,
          // color: Colors.white,
          child: Row(
            children: [
              ImageIcon(
                 AssetImage(
                    icon),
                color: kCIconBlueBlack,
                size: 20.h,
              ),
              14.0.ESW(),
              CustomText(
                text: title.tr,
                fontW: FW.medium,
                color: kCIconBlueBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
