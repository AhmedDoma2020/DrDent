import 'package:dr_dent/Src/bloc/model/detection_location_details_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/edit_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectionLocationDetailsWidget extends StatelessWidget {
  final DetectionLocationDetailsModel model;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;
  const DetectionLocationDetailsWidget({
    required this.model,
    required this.onDeleteTap,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      // height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCOffWight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r
                ),
                child: SizedBox(
                  // color: kCMainGrey,
                  height: 56.h,
                  width: 64.w,
                  child: ImageNetwork(
                    url: model.image,
                    height: 56.h,
                    width: 64.w,
                  ),
                ),
              ),
              16.0.ESW(),
              SizedBox(
                width: 148.w,
                // height: 20.h,
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: model.name,
                      fontW: FW.semicond,
                      overflow: true,
                      maxLines: 1,
                    ),
                    8.0.ESH(),
                    SizedBox(
                      width: 124.w,
                      child: CustomText(
                        text: model.phone,
                        fontW: FW.semicond,
                        color: kCSubMain,
                        overflow: true,
                        maxLines: 1,
                      ),
                    ),
                    8.0.ESH(),
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage("assets/icons/moneys.png"),
                          size: 16.sp,
                          color: kCSubMain,
                        ),
                        8.0.ESW(),
                        SizedBox(
                          width: 124.w,
                          child: CustomText(
                            text: "سعر الكشف: ${model.price}",
                            fontW: FW.semicond,
                            overflow: true,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    8.0.ESH(),
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage("assets/icons/location.png"),
                          size: 16.sp,
                          color: kCSubMain,

                        ),
                        8.0.ESW(),
                        SizedBox(
                          width: 124.w,
                          child: CustomText(
                            text: model.address,
                            fontW: FW.semicond,
                            overflow: true,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              EditWidget(onEditTap: onEditTap),
              DeleteWidget(onDeleteTap: onDeleteTap),
            ],
          ),
        ],
      ),
    );
  }
}
