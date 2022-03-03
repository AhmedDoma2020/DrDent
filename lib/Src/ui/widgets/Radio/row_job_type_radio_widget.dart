import 'package:dr_dent/Src/bloc/model/user_type_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class RowJobTypeRadioWidget extends StatefulWidget {
  final Function(int) onTap;
  int userInPutType ;

  RowJobTypeRadioWidget({Key? key, required this.onTap, this.userInPutType=0}) : super(key: key);
  @override
  State<RowJobTypeRadioWidget> createState() => _RowJobTypeRadioWidgetState();
}
class _RowJobTypeRadioWidgetState extends State<RowJobTypeRadioWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(horizontal:40.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  focusColor:  kCMain,
                  activeColor: kCMain,
                  hoverColor: kCMain,
                  groupValue: widget.userInPutType,
                  value: jobTypes[0].id,
                  onChanged: (dynamic value){
                    setState(() {
                      debugPrint("$value");
                      widget.userInPutType = value;
                      widget.onTap(value);
                      // _.estGender = userInPutType;
                    });
                  },
                ),
                CustomText(text: jobTypes[0].title,),
              ],
            ),
            Row(
              children: [
                Radio(
                  focusColor:  kCMain,
                  activeColor: kCMain,
                  hoverColor: kCMain,
                  groupValue: widget.userInPutType,
                  value: jobTypes[1].id,
                  onChanged: (dynamic value){
                    setState(() {
                      debugPrint("$value");
                      widget.userInPutType = value;
                      widget.onTap(value);
                    });
                  },
                ),
                CustomText(text: jobTypes[1].title,),
              ],
            ),
          ],
        ),
      );
  }
}
