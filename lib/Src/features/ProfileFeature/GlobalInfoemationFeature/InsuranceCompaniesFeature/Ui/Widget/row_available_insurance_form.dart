import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowAvailableInsuranceForm extends StatefulWidget {
  final InsuranceModel insurance;
   // bool? isSelect;
  final  VoidCallback  onSelectTap;
  RowAvailableInsuranceForm({
    required this.insurance,
    required this.onSelectTap,
    // required this.isSelect,
    Key? key,
  }) : super(key: key);
  @override
  State<RowAvailableInsuranceForm> createState() => _RowAvailableInsuranceFormState();
}
class _RowAvailableInsuranceFormState extends State<RowAvailableInsuranceForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelectTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        height: 32.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                // color: Colors.greenAccent,
                constraints: BoxConstraints(maxWidth: 280.w),
                child: CustomText(
                  text: widget.insurance.title,
                  fontSize: 14.w,
                  fontW: FW.semibold,
                )),
           Container(
             height: 24.h,
             width: 24.h,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(1.5),
               border: Border.all(width: 2.w,color: widget.insurance.active==false? kCMainGrey:kCSubMain,),
               color: widget.insurance.active==false? Colors.transparent : kCSubMain,
             ),
             child:widget.insurance.active==false?0.0.ESH(): Icon(Icons.check,size: 14.w,color: Colors.white,),
           )
          ],
        ),
      ),
    );
  }
}
