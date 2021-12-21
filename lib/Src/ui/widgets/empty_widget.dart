import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class EmptyIconWidget extends StatelessWidget {
  final String title;
  final String image;

  const EmptyIconWidget({Key? key,this.title=' ',this.image=' '}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/$image',
          height: 110.h,
        ),
        24.0.ESH(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              fontSize: 18,
              fontW: FW.semibold,
              color: kCMainBlack2,
            ),
          ],
        ),
      ],
    );
  }
}
