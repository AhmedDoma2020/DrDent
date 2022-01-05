import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import '/src/core/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabsCategory extends StatelessWidget {
  const TabsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30.h,
      child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){

            },
            child: Container(
              height: 30.h,
              color: Colors.transparent,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: CustomText(
                    text: 'مواد خام',
                    color: kCMainBlack2,
                    fontW: FW.thin,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => 0.0.ESW(),
          itemCount: 30,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}
