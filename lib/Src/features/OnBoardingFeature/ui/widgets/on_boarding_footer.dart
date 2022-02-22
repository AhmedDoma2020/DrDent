import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'on_boarding_dot.dart';



class OnBoardingFooter extends StatelessWidget {
  final int index;
  OnBoardingFooter({this.index=0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 16.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i = 0 ; i<4 ; i++ )
            OnBoardingDot(active: i==index,),
        ],
      ),
    );
  }
}
