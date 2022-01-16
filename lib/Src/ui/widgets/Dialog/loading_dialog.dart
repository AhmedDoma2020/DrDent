import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child:
        SpinKitRipple(
          color: kCMain,
          size: 70.0.w,
        ),
        // CircularProgressIndicator(backgroundColor: ConstantColor.MAIN_Yellow,),
      ),
    );
  }
}
