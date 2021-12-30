import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class TopTitleInButtonSheet extends StatelessWidget {
  const TopTitleInButtonSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 68.h,
      child: Column(
        children: [
          8.0.ESH(),
          Container(
            height: 4.h,
            width: 30.w,
            color: const Color(0xFF151534),
          ),
          16.0.ESH(),
          CustomText(text: title.tr,fontW: FW.demi,fontSize: 16,),
          16.0.ESH(),
          Divider(
            height: 1.h,
            color: kCGreyBorder,
          ),
        ],
      ),
    );
  }
}
