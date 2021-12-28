import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/StoreFeature/ui/screens/product_screen.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '/src/core/utils/extensions.dart';


class CardProduct extends StatelessWidget {
  final double width;
  final double height;
  const CardProduct({Key? key,this.width=192.14,this.height=169}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductScreen());
      },
      child: Container(
        height: height.h,
        width: width.w,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 8.5.w,
                vertical: 8.h
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),

                ),
                child: ImageNetwork(
                    url: 'https://images.pexels.com/photos/3293148/pexels-photo-3293148.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    width: width,
                    height: height/1.7,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 8.w
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'أدوات تنظيف الأسنان',
                        fontSize: 14,
                        overflow: true,
                        fontW: FW.demi,
                        color: kCMainBlack2,
                      ),
                    ],
                  ),
                  3.0.ESH(),
                  Row(
                    children: [
                      CustomText(
                        text: 'الشركة الطبية العالمية',
                        fontSize: 9,
                        overflow: true,
                        fontW: FW.thin,
                        color: kCMainGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
