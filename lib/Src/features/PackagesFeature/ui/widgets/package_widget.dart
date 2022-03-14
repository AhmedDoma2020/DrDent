import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';
class PackageWidget extends StatelessWidget {
  const PackageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 227.w,
      height: 353.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCMainScaffoldGrey,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical:   16.h
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'special_package',
              color: kCMainBlack2,
              fontW: FW.semicond,
              fontSize: 16,
            ),
            15.0.ESH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: '25000 LE',
                  color: kCMainBlack2,
                  fontW: FW.demi,
                  fontSize: 24,
                ),
                CustomText(
                  text: 'per_year',
                  color: kCMainBlack2,
                  fontW: FW.light,
                  fontSize: 12,
                ),
              ],
            ),
            32.0.ESH(),
            ButtonDefault(
              title: 'subscribe_now',
              width: 179,
              height: 48,
            ),
            15.0.ESH(),
            CustomText(
              text: '${'renewed_at_a_price'.tr} 25000 ${'E_G_P'.tr} ${'per_year'.tr}',
              color: kCMainBlack2,
              fontW: FW.light,
              fontSize: 12,
            ),
            32.0.ESH(),
            Expanded(child: ListView.separated(
                itemBuilder: (context, index) => Row(
                  children: [
                    Icon(Icons.check ,color: kCSubMain,size: 15.h,),
                    7.0.ESW(),
                    CustomText(
                      text: 'مثال للميزة الأولي',
                      color: kCMainBlack2,
                      fontW: FW.light,
                      fontSize: 12,
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => 10.0.ESH(),
                itemCount: 3,
              shrinkWrap: true,
            )),
          ],
        ),
      ),
    );
  }
}
