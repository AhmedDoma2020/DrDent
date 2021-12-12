import 'dart:ui';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  Color? color;
  LoadingDialog({this.color=kCMain});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
          },
          size: 40.w,
        ),
      ),
    );
  }
}
