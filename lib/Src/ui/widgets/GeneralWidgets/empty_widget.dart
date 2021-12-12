import 'package:dr_dent/Src/ui/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'custom_text.dart';

class EmptyWidget extends StatelessWidget {
  final String image;
  final double imageH;
  final double imageW;
  final String title;
  final String subTitle;
  final String titleButton;
  final VoidCallback onTapButton;
  final bool availableButton;

  EmptyWidget(
      {
        this.image = "assets/image/signInFrist.png",
        required this.imageH,
      required this.imageW,
      this.title = "Please_login",
       this.subTitle = "Please_login_to_view_your_current_and_past_orders",
      this.titleButton = "sign_in",
        required this.onTapButton ,
        this.availableButton=true,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: imageH.h,
              width: imageW.w,
              child: Center(
                child: Image.asset(
                  image,
                  height: imageH.h,
                  width: imageW.w,
                ),
              ),
            ),
          ),
          SizedBox(height: 31.h),
          Container(
            width: 208.w,
            child: CustomText(
              text: title.tr,
              fontSize: 20,
              fontW: FW.bold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 343.w,
            child: CustomText(
              text: subTitle.tr,
              fontSize: 14,
              fontW: FW.regular,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.h),
          availableButton?
          BaseButton(
            child: Center(
              child: CustomText(
                text: titleButton.tr,
                fontW: FW.semibold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
            ),
            width: 193,
            height: 45,
            onTap: (){},
            radius: 8,
          ):SizedBox(height: 0,),
        ],
      ),
    ));
  }
}
