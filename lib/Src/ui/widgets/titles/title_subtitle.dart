import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TitleSubtitle extends StatelessWidget {

  // texts

  final String tile;
  final String subtitle;

  // sizes

  final double tileSize;
  final double subTitleSize;


  // colors

  final Color tileColor;
  final Color subTitleColor;




  const TitleSubtitle({Key? key,
    this.tile='',
    this.subtitle='',
    this.tileSize=18.0,
    this.subTitleSize=12.0,
    this.tileColor= kCBlackTitle,
    this.subTitleColor = kCSubTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: tile,
          color: tileColor,
          fontW: FW.bold,
          fontSize: tileSize,
        ),
        8.0.ESH(),
        SizedBox(
          width: 330.w,
          child: CustomText(
            text: subtitle,
            color: subTitleColor,
            fontW: FW.light,
            fontSize: subTitleSize,
          ),
        ),
      ],
    );
  }
}
