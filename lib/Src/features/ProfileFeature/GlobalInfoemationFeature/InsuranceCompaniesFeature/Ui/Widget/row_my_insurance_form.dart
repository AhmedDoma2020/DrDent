import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowMyInsuranceForm extends StatelessWidget {
  const RowMyInsuranceForm({
    required this.insurance,
    required this.onDeleteTap,
     this.isDelete = true,
    Key? key,
  }) : super(key: key);
  final InsuranceModel insurance;
  final VoidCallback onDeleteTap;
  final bool isDelete ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      height: 66.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: kCOffWight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 36.h,
                width: 42.w,
                child: ImageNetwork(
                  url:insurance.image,
                  height: 36.h,
                  width: 42.w,
                ),
              ),
              16.0.ESW(),
              Container(
                  constraints: BoxConstraints(maxWidth: 180.w),
                  child: CustomText(
                    text: insurance.title,
                    fontW: FW.semibold,
                    fontSize: 16,
                  )),
            ],
          ),
          isDelete?
          InkWell(
            onTap: onDeleteTap,
            borderRadius: BorderRadius.circular(777.r),
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
          ):0.0.ESW(),
        ],
      ),
    );
  }
}
