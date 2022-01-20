import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class SearchRow extends StatelessWidget {
  final VoidCallback? onGridTap;
  const SearchRow({Key? key,this.onGridTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.h,
          width: 280.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/search2.png',
                  height: 16.7,
                  color: kCMainGrey,
                ),
                6.7.ESW(),
                CustomText(
                  text: 'بحث',
                  fontSize: 12,
                  fontW: FW.light,
                  color: kCMainGrey,
                ),
                // SizedBox(
                //   width: 200.w,
                //   child: TextField(
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         hintText: 'بحث',
                //         hintStyle: TextStyle(
                //             color: kCMainGrey,
                //             fontSize: 12.sp,
                //             fontFamily: 'light'
                //         )
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onGridTap ??(){},
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: kCMain,
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/grid.png',
                height: 25.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
