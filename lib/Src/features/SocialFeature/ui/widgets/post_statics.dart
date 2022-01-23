import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class PostStatics extends StatelessWidget {
  final String icon;
  final String count;
  final VoidCallback? onTap;
  final Color iconColor;
  const PostStatics({Key? key,this.onTap,required this.icon , required this.count,this.iconColor=kCMainGrey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/${icon}',
            color: iconColor,
            height: 20.h,
          ),
          7.0.ESW(),
          CustomText(
            text: count,
            color: kCMainGrey,
            fontSize: 14,
            fontW: FW.medium,
          ),
        ],
      ),
    );
  }
}
