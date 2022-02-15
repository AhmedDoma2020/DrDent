import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmptyWidget extends StatelessWidget {
  final String image;
  final double imageH;
  final double imageW;
  final String title;
  final String subTitle;
  final String titleButton;
  final VoidCallback onTapButton;
  final bool availableButton;
  final int spaceBetweenTitleAndSubTitle;

  EmptyWidget(
      {Key? key,
        required this.image,
         this.imageH=140,
         this.imageW=132,
        this.title = "",
        this.subTitle = "",
        this.titleButton = "",
        this.spaceBetweenTitleAndSubTitle = 16,
        required this.onTapButton ,
        this.availableButton=true,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
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
              SizedBox(
                width: 208.w,
                child: CustomText(
                  text: title.tr,
                  fontSize: 20,
                  fontW: FW.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: spaceBetweenTitleAndSubTitle.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                onTap: onTapButton,
                radius: 8,
              ):const SizedBox(height: 0,),
            ],
          ),
        ));
  }
}
