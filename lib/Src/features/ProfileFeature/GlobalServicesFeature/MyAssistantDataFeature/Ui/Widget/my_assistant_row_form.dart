import 'package:dr_dent/Src/bloc/model/assitant_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/delete_widget.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/edit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAssistantRow extends StatelessWidget {
  final AssistantModel assistant;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;
  const MyAssistantRow({
    required this.assistant,
    required this.onDeleteTap,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCOffWight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ImageIcon(
                    const AssetImage("assets/icons/personalInfoIcon.png"),
                    color: kCSubMain,
                    size: 14.w,
                  ),
                  8.0.ESW(),
                  Container(
                    // width: 200.w,
                      constraints: BoxConstraints(maxWidth: 200.w,minWidth: 120.w),
                      // color: Colors.yellow,
                      child: CustomText(
                        text: assistant.name,
                        fontSize: 12,
                        fontW: FW.semibold,
                      )),
                ],
              ),
              8.0.ESH(),
              Row(
                children: [
                  ImageIcon(
                    const AssetImage("assets/icons/GPhone.png"),
                    color: kCSubMain,
                    size: 14.w,
                  ),
                  8.0.ESW(),
                  Container(
                    // width: 200.w,
                      constraints: BoxConstraints(maxWidth: 200.w,minWidth: 120.w),
                      // color: Colors.yellow,
                      child: CustomText(
                        text: assistant.phone,
                        fontSize: 12,
                        fontW: FW.semibold,
                      )),
                ],
              ),
            ],
          ),

          Row(
            children: [
              IconWidget(onEditTap: onEditTap),
              DeleteWidget(onDeleteTap: onDeleteTap),
            ],
          ),
        ],
      ),
    );
  }
}
