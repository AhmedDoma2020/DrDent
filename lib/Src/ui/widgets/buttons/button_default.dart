import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
import 'base_button.dart';


enum ButtonStyle{
  withBorder,
  withOutBorder
}


class ButtonDefault extends StatelessWidget {
  final String title;
  final String iconImage;
  final Color buttonColor;
  final Color disActiveButtonColor;
  final Color titleColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final double radius;
  final double titleSize;
  final double iconHeight;
  final Color? borderColor;
  final Color disActiveBorderColor;
  final bool? active;
  final Widget? child;
  final bool isLoading;
  ButtonDefault({
    this.isLoading=false,
    this.child,
    this.borderColor,this.disActiveButtonColor=kCDisActiveButton,this.disActiveBorderColor=kCDisActiveButton,this.titleSize=16,this.iconHeight=12,this.radius=kNRadius,this.title='', this.iconImage='', this.buttonColor=kCActiveButton, this.titleColor=kCButtonTitle,
    this.iconColor=kCButtonTitle, this.onTap,this.height=48,this.width=343,this.active=true
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      height: height.h,
      width: width.w,
      radius: radius.r,
      borderColor: active! ? borderColor :disActiveBorderColor,
      buttonColor: active! ? buttonColor:disActiveButtonColor.withOpacity(0.08),
      onTap: onTap,
      child: child??drawChild(),
    );
  }
  Widget drawChild(){
    if(title.isNotEmpty&&iconImage.isEmpty){
      // TODO return text only
      return Center(
        child: CustomText(
          text: title.tr,
          color: titleColor,
          fontSize: titleSize,
          fontW: FW.semibold,
        ),
      );
    }else if(title.isEmpty&&iconImage.isNotEmpty){
      // TODO return icon only
      return Center(
        child: Image.asset(
          'assets/icons/$iconImage',
          color: iconColor,
          height: iconHeight,
        )
        );
    }else if(title.isNotEmpty&&iconImage.isNotEmpty){
      // TODO return icon and text
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              color: titleColor,
              fontSize: titleSize,
              fontW: FW.semibold,
            ),
            7.0.ESW(),
            isLoading? SizedBox(
              height: 12.h,
              width: 12.h,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.w,
              ),
            ):
            Image.asset(
              'assets/icons/$iconImage',
              color: iconColor,
              height: iconHeight,
            )
          ],
        ),
      );
    }else{
      // TODO return text only
      return Center(
        child: CustomText(
          text: title,
          color: titleColor,
          fontSize: titleSize,
          fontW: FW.semibold,
        ),
      );
    }
  }
}
