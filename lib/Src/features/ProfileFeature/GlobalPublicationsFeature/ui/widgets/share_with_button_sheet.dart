import 'package:dr_dent/Src/bloc/model/item_of_share_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/SocialFeature/bloc/Controller/add_post_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'item_share_with_button_sheet_widget.dart';

class ShareWithButtonSheet extends StatelessWidget {
  const ShareWithButtonSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          6.0.ESH(),
          Center(
            child: Container(
              height: 4.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: kCLightGrey,
              ),
            ),
          ),
          24.0.ESH(),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: CustomText(
              text: "share_with".tr,
              fontW: FW.medium,
            ),
          ),
          20.0.ESH(),
          GetBuilder<AddPostController>(
            builder:(_) =>  SizedBox(
              // color: Colors.tealAccent,
              height: 110.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) =>  GestureDetector(
                 onTap: (){
                   _.changeIsSelected(index);
                 },
                 child: ItemShareWithButtonSheetWidget(
                   title: _.shareItemsDoctorList[index].title,
                   icon: _.shareItemsDoctorList[index].icon,
                   isSelected: _.shareItemsDoctorList[index].isSelected,
                 ),
               ),
                itemCount: _.shareItemsDoctorList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}





