import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class RowJopRequirementForm extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final int index;
  final int numOfList;
  const RowJopRequirementForm({
    required this.onTap,
    required this.text,
    this.index=0,
    this.numOfList=1,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconData setIcon(int index , int numOfList ){
      IconData? icon;
      if( index == 0){
        icon =Icons.add;
      } else if((index +1) == numOfList){
        icon =Icons.clear;
      }else{
        icon =Icons.check;
      }
      return icon;
    }
    Color setBoxColor(int index , int numOfList ){
      Color? color;
      if( index == 0){
        color =kCMain;
      } else if((index +1) == numOfList){
        color =kCMainRed.withOpacity(0.10);
      }else{
        color =kCMain;
      }
      return color;
    }
    Color setIconColor(int index , int numOfList ){
      Color? color;
      if( index == 0){
        color =Colors.white;
      } else if((index +1) == numOfList){
        color =kCMainRed;
      }else{
        color =Colors.white;
      }
      return color;
    }
    debugPrint("numOfList $numOfList");
    debugPrint("index $index");
    return Row(
      children: [
        Expanded(
          child: TextFieldDefault(
            hint: 'add_other_requirements'.tr,
            // errorText: "error_set_offer_duration".tr,
            disableBorder: Colors.transparent,
            keyboardType: TextInputType.text,
            filledColor: kCBGTextFormFiled,
            fieldType: FieldType.WithBorder,
            enableBorder: Colors.transparent,
            horizentalPadding: 16,
            onComplete: () {},
          ),
        ),
        16.0.ESW(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 68.h,
            width: 68.h,
            decoration: BoxDecoration(
              color: setBoxColor(index,numOfList),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
                child: Icon(
                  setIcon(index,numOfList)
                  // index==0?Icons.add :Icons.clear
                  ,color:setIconColor(index,numOfList),)),
          ),
        ),
      ],
    );
  }
}
