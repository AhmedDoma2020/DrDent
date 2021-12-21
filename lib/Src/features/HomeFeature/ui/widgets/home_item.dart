import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/HomeFeature/bloc/model/home_model.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/src/core/utils/extensions.dart';

class HomeItem extends StatelessWidget {
  final HomeModel homeModel;
  final VoidCallback onTap;
  HomeItem({required this.homeModel,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: (){
          onTap();
        },
        child: Container(
          // width: 343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kNCardRadius),
            color: kCTFActiveBackGround,
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 16.w
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CustomText(
                         text: homeModel.title,
                         color: kCMainBlack2,
                         fontSize: 14,
                         fontW: FW.demi,
                       ),
                      CustomText(
                        text: homeModel.subtitle,
                        color: kCMainBlack2,
                        fontSize: 12,
                        fontW: FW.demi,
                      ),
                    ],
                  ),
                ),
                10.0.ESW(),
                Image.asset(
                  'assets/icons/${homeModel.icon}',
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
