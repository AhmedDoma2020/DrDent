import 'dart:async';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeServices{
  static pinCodeWidget({
    Function? onChanged,
    int fieldCounts = 6,
    double fieldWidth=50.0,
    required BuildContext context,required TextEditingController textEditingController ,required StreamController<ErrorAnimationType> errorController}){
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 19.h),
        child: PinCodeTextField(
          enablePinAutofill: true,
          keyboardType: TextInputType.number,
          cursorColor: const Color(0xff4E70DB),
          appContext: context,
          length: fieldCounts,
          obscureText: false,
          pastedTextStyle: TextStyle(
              color: kCMain,
              fontSize: 15.sp,
              fontFamily: "bahij-semibold"
          ),
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            inactiveColor: Colors.transparent,
            inactiveFillColor: const Color(0xffF3F4F6),
            // activeColor: Color(0xff4E70DB),
            activeColor: kCMain,
            disabledColor: Colors.black,
            selectedFillColor: Color(0xffF3F4F6),
            selectedColor: kCMain,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12.r),
            fieldHeight: 72.h,
            fieldWidth: fieldWidth.w,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          onCompleted: (v) {
            // debugPrint("Completed");
          },
          onChanged: (value) {
            // onChanged(value);
          },
          beforeTextPaste: (text) {
            // debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}