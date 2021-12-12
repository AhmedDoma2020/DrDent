import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';


import '/src/core/utils/extensions.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class TitleTwoInLine extends StatelessWidget {

  // texts

  final String tile;
  final String secondTile;

  // sizes

  final double tileSize;
  final double secondTileSize;


  // colors

  final Color tileColor;
  final Color secondTileColor;



  final VoidCallback? onTap;




   TitleTwoInLine({
    this.tile='',
    this.tileSize=14.0,
    this.tileColor= kCMainGrey,
    this.secondTile='',
    this.secondTileSize=14.0,
    this.secondTileColor= kCBlackTitle,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: tile,
              color: tileColor,
              fontW: FW.semibold,
              fontSize: tileSize.w,
            ),
            6.0.ESW(),
            CustomText(
              text: secondTile,
              color: kCMain,
              fontW: FW.semibold,
              fontSize: tileSize.w,
            ),
          ],
        ),
      ),
    );
  }
}
