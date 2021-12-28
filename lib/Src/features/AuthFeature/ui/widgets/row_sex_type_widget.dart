import 'package:dr_dent/Src/bloc/model/user_type_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/enter_my_personal_data_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class RowGenderWidget extends StatefulWidget {
  @override
  State<RowGenderWidget> createState() => _RowGenderWidgetState();
}
class _RowGenderWidgetState extends State<RowGenderWidget> {
  int userInPutType = 0;
  @override
  Widget build(BuildContext context) {
    return           Container(
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal:40.w),
      child: GetBuilder<EnterMyPersonalDataController>(
        builder: (_) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "type_",),
            Row(
              children: [
                Radio(
                  focusColor:  kCMain,
                  activeColor: kCMain,
                  hoverColor: kCMain,
                  groupValue: userInPutType,
                  value: types[0].id,
                  onChanged: (dynamic value){
                    setState(() {
                      userInPutType = value;
                      _.estGender = userInPutType;
                    });
                  },
                ),
                CustomText(text: types[0].title,),
              ],
            ),
            Row(
              children: [
                Radio(
                  focusColor:  kCMain,
                  activeColor: kCMain,
                  hoverColor: kCMain,
                  groupValue: userInPutType,
                  value: types[1].id,
                  onChanged: (dynamic value){
                    setState(() {
                      userInPutType = value;
                      _.estGender = userInPutType;
                    });
                  },
                ),
                CustomText(text: types[1].title,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
