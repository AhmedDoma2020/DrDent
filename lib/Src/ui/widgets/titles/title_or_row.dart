import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
import 'package:get/get.dart';
class TitleOrRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 16.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: .5.h,
              color: kCStatusDisActiveTitle,
            ),
          ),
          14.0.ESW(),
          CustomText(
            text: 'or_sign_in_with'.tr,
            fontW: FW.regular,
            color: kCStatusDisActiveTitle,
            fontSize: 14,
          ),
          14.0.ESW(),
          Expanded(
            child: Container(
              height: .5.h,
              color: kCStatusDisActiveTitle,
            ),
          ),
        ],
      ),
    );
  }
}
