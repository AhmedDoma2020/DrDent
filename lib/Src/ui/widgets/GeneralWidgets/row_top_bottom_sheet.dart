import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cancel_icon.dart';
import 'custom_text.dart';

class RowTopBottomSheet extends StatelessWidget {
  final String title;
  final bool isClose;
  RowTopBottomSheet({required this.title,this.isClose=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 28.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CancelIcon( onTap: (){Get.back();},),
          CustomText(text: title.tr,fontW: FW.semibold,fontSize: 18,),
          SizedBox( width: 28.w, height: 28.w)
        ],
      ),
    );
  }
}
