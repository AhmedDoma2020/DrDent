import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 24.w
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: ImageNetwork(
                width: 40.w,
                height: 40.w,
                url: 'https://images.pexels.com/photos/6149104/pexels-photo-6149104.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              ),
            ),
            16.0.ESW(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'رشا السيد ',
                  color: kCMainBlack2,
                  fontSize: 16,
                  fontW: FW.bold,
                ),
                3.0.ESH(),
                CustomText(
                  text: 'مايو27, 2021 ',
                  color: kCMainBlack2,
                  fontSize: 12,
                  fontW: FW.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
