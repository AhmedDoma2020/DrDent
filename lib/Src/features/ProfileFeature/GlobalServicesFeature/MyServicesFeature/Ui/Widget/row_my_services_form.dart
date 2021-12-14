import 'package:dr_dent/Src/bloc/model/service_resource.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RowMyServiceForm extends StatelessWidget {
  const RowMyServiceForm({
    required this.service,
    required this.onDeleteTap,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);
  final ServiceModel service;

  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      // height: 66.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color:
            kCOffWight
            // Colors.yellowAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 220.w),
                // color: Colors.greenAccent,
                child: CustomText(
                  text: service.title,
                  fontW: FW.semibold,
                  fontSize: 16,
                ),
              ),
              14.0.ESH(),
              Row(
                children: [
                  SizedBox(
                    height: 14.h,
                    width: 14.h,
                    child: Image.asset("assets/icons/moneys.png",height: 14.h,
                      width: 14.h,),
                  ),
                  8.0.ESW(),
                  CustomText(text: "${"Service_cost:".tr} ${service.price}",fontSize: 11,fontW: FW.regular,color: kCGreyTitle,),
                ],
              ),
              8.0.ESH(),
              Row(
                children: [
                  SizedBox(
                    height: 14.h,
                    width: 14.h,
                    child: Image.asset("assets/icons/clockIcon.png",height: 14.h,
                      width: 14.h,),
                  ),
                  8.0.ESW(),
                  CustomText(text: "${"duration_of_service:".tr} ${service.time}",fontSize: 11,fontW: FW.regular,color: kCGreyTitle,),
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: onDeleteTap,
                borderRadius: BorderRadius.circular(777.r),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                  child: Container(
                    height: 32.h,
                    width: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(777.r),
                      color: kCMain.withOpacity(0.08),
                    ),
                    child: Center(
                      child: ImageIcon(
                        const AssetImage("assets/icons/edit.png"),
                        color: kCMain,
                        size: 24.h,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: onDeleteTap,
                borderRadius: BorderRadius.circular(777.r),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                  child: Container(
                    height: 32.h,
                    width: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(777.r),
                      color: kCMain.withOpacity(0.08),
                    ),
                    child: Center(
                      child: ImageIcon(
                       const AssetImage("assets/icons/delete.png"),
                        color: kCMain,
                        size: 24.h,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
