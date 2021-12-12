import 'package:dr_dent/Src/ui/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'cancel_icon.dart';
import 'custom_text.dart';

class EmptyWidgetFullScreen extends StatelessWidget {
  final int topPadding;
  final String image;
  final double imageH;
  final double imageW;
  final String title;
  final String subTitle;
  final String titleButton;
  final VoidCallback onTapButton;
  final bool isBack;

  EmptyWidgetFullScreen({
     this.topPadding = 90,
    required this.image,
    required this.imageH,
    required this.imageW,
    required this.title,
    required this.subTitle,
    required this.titleButton,
    required this.onTapButton,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: topPadding.h),
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
                  ],
                ),
                BaseButton(
                  child: Center(
                    child: CustomText(
                      text: titleButton.tr,
                      fontW: FW.semibold,
                      fontSize: 16,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  width: double.infinity,
                  height: 56,
                  onTap: onTapButton,
                  radius: 8,
                ),
              ],
            ),
            isBack?
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: Align(
                alignment: Alignment.topRight,
                child: CancelIcon( onTap: (){Get.back();},),
              ),
            ):SizedBox(height: 0,)
          ],
        ),
      ),
    );
  }
}

