import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/constants/color_constants.dart';


  class BaseButton extends StatelessWidget {

  final Color buttonColor;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color? borderColor;
  final double radius;
  final Widget? child;

  BaseButton({
    this.borderColor , this.child , this.radius=kNRadius, this.buttonColor=kCMain, this.onTap,this.height=56,this.width=343
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){
        print('hello this tap in button');
      },
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
              color: borderColor??Colors.transparent,
              width: borderColor!=null?1:0
          ),
          color: buttonColor,
        ),
        child: child??Center(),
      ),
    );
  }
}
