import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ItemShareWithButtonSheetWidget extends StatelessWidget {
  final String icon;
  final String title;

  final bool isSelected;

  const ItemShareWithButtonSheetWidget({
    required this.icon,
    required this.title,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          Container(
            height: 54.w,
            width: 54.w,
            decoration: BoxDecoration(
              color:isSelected ? kCMain: kCLightGrey,
              borderRadius: BorderRadius.circular(777.r),
            ),
            child: Center(
                child: ImageIcon(
              AssetImage(icon),
              color:isSelected ? Colors.white : kCMainGrey,
              size: 20.w,
            )),
          ),
          10.0.ESH(),
          CustomText(
            text: title.tr,
            fontSize: 10,
            fontW: FW.medium,
            color: isSelected ? kCMain:kCBlackTitle,
          ),
        ],
      ),
    );
  }
}
