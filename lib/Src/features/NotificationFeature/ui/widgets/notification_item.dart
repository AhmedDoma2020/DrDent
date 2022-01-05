import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 16.0.w
      ),
      child: Container(
         width: double.infinity,
        child: Row(
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
                url: 'https://images.pexels.com/photos/10440645/pexels-photo-10440645.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              ),
            ),
            16.0.ESW(),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'هذا النص هو مثال ',
                      fontW: FW.light,
                      fontSize: 10,
                      color: kCMainGrey,
                    ),
                    6.0.ESH(),
                    CustomText(
                      text: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',
                      fontW: FW.light,
                      fontSize: 14,
                      color: kCMainBlack2,
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
