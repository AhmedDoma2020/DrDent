import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TabsIos extends StatelessWidget {

  final List<String> titles ;
  final Function(int) onTap;
  final int tabIndex;
  const TabsIos({Key? key,required this.titles,required this.onTap,this.tabIndex=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 343.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(width: 1,color: kCMainBorder)
      ),
      child: Row(
        children: [
          for(int i =0 ; i<titles.length ; i++)
            Expanded(
                child: GestureDetector(
                  onTap: (){
                    onTap(i);
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                      color: tabIndex==i ? kCMainOverlay:Colors.transparent
              ),
              height: 40.h,
                      child: Center(
                        child: CustomText(
                          text: titles[i],
                          color: tabIndex==i ? kCMainBlack2:kCMainGrey,
                          fontW: FW.medium,
                          fontSize: 14,
                        ),
                      ),
            ),
                  ),
                ),
            )
        ],
      ),
    );
  }
}
