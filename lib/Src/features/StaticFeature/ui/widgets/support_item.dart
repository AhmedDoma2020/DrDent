import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';
class SupportItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  const SupportItem({Key? key,required this.onTap,required this.title,required this.subtitle,required this.color,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 62.w,
                height: 51.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Color(0xff1151D9)
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/$icon',
                    height: 27.h,
                  ),
                ),
              ),
              16.0.ESW(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      color: kCMainBlack2,
                      fontSize: 14,
                      fontW: FW.medium,
                    ),
                    7.0.ESH(),
                    CustomText(
                      text: subtitle,
                      color: kCMainBlack2,
                      fontSize: 14,
                      fontW: FW.medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
