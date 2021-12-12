import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  final int h;

  CustomDivider({this.h = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h.h,
      width: double.infinity,
      color: Color(0xFFF4F4F4),
    );
  }
}
