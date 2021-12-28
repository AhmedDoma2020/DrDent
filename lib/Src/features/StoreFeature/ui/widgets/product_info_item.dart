import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';


class ProductInfoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProductInfoItem({Key? key,required this.title,required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: kCMainBlack2,
          fontW: FW.demi,
          fontSize: 18,
        ),
        5.0.ESH(),
        CustomText(
          text: subtitle,
          color: kCMainGrey,
          fontW: FW.thin,
          fontSize: 12,
        ),
      ],
    );
  }
}
