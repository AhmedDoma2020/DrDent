import 'package:dr_dent/Src/bloc/model/onboarding_item.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';



class OnBoardingBody extends StatelessWidget {
  final OnBoardingItem? onBoardingItem;


  OnBoardingBody({this.onBoardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        99.0.ESH(),
        Center(
          child: Image.asset(
            'assets/image/${onBoardingItem!.image}',
            height: 230.h,
            width: 230.w,
          ),
        ),
        64.0.ESH(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.w
          ),
          child: CustomText(
            text: onBoardingItem!.title,
            color: kCBlackTitle,
            fontW: FW.bold,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
        ),
        26.0.ESH(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 40.w
          ),
          child: CustomText(
            text: onBoardingItem!.subtitle,
            color: kCBlackTitle,
            fontW: FW.light,
            fontSize: 12.8,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
