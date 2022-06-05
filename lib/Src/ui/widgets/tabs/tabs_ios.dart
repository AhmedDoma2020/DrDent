import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsIos extends StatelessWidget {
  final List<String> titles;

  final Function(int) onTap;
  final int tabIndex;
  final Color activeCardColor;
  final Color activeTitleColor;
  final Color disActiveTitleColor;
  final Color backGroundColor;
  final Color borderColor;

  const TabsIos({
    Key? key,
    required this.titles,
    required this.onTap,
    this.tabIndex = 0,
    this.activeCardColor = kCMainOverlay,
    this.backGroundColor = Colors.white,
    this.borderColor = kCMainBorder,
    this.activeTitleColor = kCMainBlack2,
    this.disActiveTitleColor = kCMainGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: backGroundColor,
          border: Border.all(width: 1, color: borderColor)),
      child: Row(
        children: [
          for (int i = 0; i < titles.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  onTap(i);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: tabIndex == i ? activeCardColor : Colors.transparent),
                    height: 40.h,
                    child: Center(
                      child: CustomText(
                        text: titles[i],
                        color: tabIndex == i ? activeTitleColor : disActiveTitleColor,
                        fontW: FW.semicond,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
