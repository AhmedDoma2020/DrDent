
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class IconForm extends StatelessWidget {
  const IconForm({
    Key? key,
    required this.icon,
    required this.heightAndWidthContainer,
    required this.heightAndWidthIcon,
    required this.backGroundColor,
  }) : super(key: key);

  final String icon;
  final int heightAndWidthContainer;
  final int heightAndWidthIcon;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightAndWidthContainer.h,
      width: heightAndWidthContainer.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(777.r),
        color: backGroundColor,
      ),
      child: Center(
        child: SizedBox(
            height:heightAndWidthIcon.h,
            width:heightAndWidthIcon.h,
            child: Image.asset(icon),
        ),
      ),
    );
  }
}
