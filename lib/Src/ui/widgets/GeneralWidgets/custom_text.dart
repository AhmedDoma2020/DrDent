
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final bool textShadow;
  final bool? overflow;
  final bool? underline;
  final FW? fontW;
  final EdgeInsetsGeometry? padding;
  final bool? lineThrough;
  final int? maxLines;

  CustomText({
    @required this.text,
    this.color= kCBlackTitle,
    this.fontSize=14.0,
    this.textAlign,
    this.letterSpacing,
    this.textShadow = false,
    this.overflow = false,
    // this.toUpperCase = true,
    this.underline = false,
    this.fontW = FW.regular,
    this.padding,
    this.lineThrough=false,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Text(
        text!.tr,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines??null,
        style: TextStyle(
          fontFamily: getFontFamily(fontW!),
          color: color ?? Colors.black,
          // fontWeight: getFontWeight(fontW),
          fontSize: fontSize!.sp,
          letterSpacing: letterSpacing,
          shadows: textShadow?
          [
            const Shadow(
              blurRadius: 0.8,
              color: Colors.black,
              offset: Offset(1, 1),
            )

          ]:null,
          decoration: lineThrough!? TextDecoration.lineThrough: underline! ? TextDecoration.underline : null,
        ),
        overflow: overflow! ? TextOverflow.ellipsis : null,
      ),
    );
  }
}

enum FW {
  bold,
  regular,
  light,
  semibold,
  medium,
  demi,
  semicond,
  thin,
}

String getFontFamily(FW fw) {
  if (fw == null) return "sst_medium";
  switch (fw) {
    case FW.bold:
      return "bold";
      break;
    case FW.regular:
      return 'regular';
      break;
    case FW.light:
      return 'light';
      break;
    case FW.semibold:
      return 'simebold';
      break;
    case FW.demi:
      return 'bold';
      break;
    case FW.semicond:
      return 'simebold';
      break;
    default:
      return 'regular';
  }
}

FontWeight getFontWeight(FW fw) {
  if (fw == null) return FontWeight.w400;
  switch (fw) {
    case FW.bold:
      return FontWeight.bold;
      break;
    case FW.regular:
      return FontWeight.w400;
      break;
    case FW.light:
      return FontWeight.w300;
      break;
    case FW.semibold:
      return FontWeight.w600;
    case FW.semibold:
      return FontWeight.w600;
      break;
    case FW.demi:
      return FontWeight.w600;
      break;
    default:
      return FontWeight.w400;
  }
}