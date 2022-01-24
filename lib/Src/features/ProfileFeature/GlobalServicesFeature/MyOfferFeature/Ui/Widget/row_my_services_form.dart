import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/service_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowMyServicesForm extends StatefulWidget {
  final ServiceModel services;
  // bool? isSelect;
  final  VoidCallback  onSelectTap;
  RowMyServicesForm({
    required this.services,
    required this.onSelectTap,
    // required this.isSelect,
    Key? key,
  }) : super(key: key);
  @override
  State<RowMyServicesForm> createState() => _RowMyServicesFormState();
}
class _RowMyServicesFormState extends State<RowMyServicesForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelectTap,
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 12.h),
        // height: 32.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.greenAccent,
                constraints: BoxConstraints(maxWidth: 280.w),
                child: CustomText(
                  text: widget.services.title,
                  fontSize: 14.w,
                  fontW: FW.semibold,
                )),
            Container(
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.5),
                border: Border.all(width: 2.w,color: widget.services.selected==false? kCMainGrey:kCSubMain,),
                color: widget.services.selected==false? Colors.transparent : kCSubMain,
              ),
              child:widget.services.selected==false?0.0.ESH(): Icon(Icons.check,size: 14.w,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
