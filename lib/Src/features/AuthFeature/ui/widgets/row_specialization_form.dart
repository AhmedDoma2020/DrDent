import 'package:dr_dent/Src/bloc/model/insurance_model.dart';
import 'package:dr_dent/Src/bloc/model/specialization_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSpecializationForm extends StatelessWidget {
  final SpecializationModel specialization;
  bool? isSelect;
  final  VoidCallback  onSelectTap;
  RowSpecializationForm({
    required this.specialization,
    required this.onSelectTap,
     this.isSelect =false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color borderColor( bool isSelected , bool isActive){
      if(isSelected == true){
        return kCSubMain;
      }else if(isActive ==true){
        return kCSubMain;
      }else{
        return kCMainGrey;
      }
    }

    Color containerColor( bool isSelected , bool isActive){
      if(isSelected == true){
        return kCSubMain;
      }else if(isActive ==true){
        return kCSubMain;
      }else{
        return Colors.transparent;
      }
    }

    Widget containerChile( bool isSelected , bool isActive){
      if(isSelected == true){
        return Icon(Icons.check,size: 14.w,color: Colors.white,);
      }else if(isActive ==true){
        return Icon(Icons.check,size: 14.w,color: Colors.white,);
      }else{
        return 0.0.ESH();
      }
    }

    return GestureDetector(
      onTap: onSelectTap,
      child: Container(
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
                  text: specialization.title,
                  fontSize: 14.w,
                  fontW: FW.semibold,
                )),
            Container(
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.5),
                border: Border.all(width: 2.w,color: borderColor(isSelect!,specialization.active) ,),
                color: containerColor(isSelect!,specialization.active) ,
              ),
              child: containerChile(isSelect!,specialization.active),
            )
          ],
        ),
      ),
    );
  }
}
