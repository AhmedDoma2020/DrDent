 import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class IconTitleRow extends StatelessWidget {
  final String title;
  final String icon;

   IconTitleRow({Key? key,required this.title ,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            'assets/icons/${icon}',
            color: kCMain,
            height: 24.h,
         ),
          10.0.ESW(),
          CustomText(
            text: title,
            color: kCBlackTitle,
            fontW: FW.semibold,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
