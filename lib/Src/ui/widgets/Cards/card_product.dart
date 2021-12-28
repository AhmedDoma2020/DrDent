import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';


class ProductCard extends StatelessWidget {
  final double width;
  final double height;
  const ProductCard({Key? key,this.width=192.14,this.height=169}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
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
            child: ImageNetwork(
                url: 'https://images.pexels.com/photos/356040/pexels-photo-356040.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                width: width,
                height: height,
            ),
          ),
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
    );
  }
}
