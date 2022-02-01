import 'package:dr_dent/Src/bloc/model/user_type_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import '../../../ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Controller/enter_personal_data_of_doctor_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class RowGenderWidget extends StatefulWidget {
  final Function(String) onTap;
  RowGenderWidget({required this.onTap});
  @override
  State<RowGenderWidget> createState() => _RowGenderWidgetState();
}
class _RowGenderWidgetState extends State<RowGenderWidget> {
  String userInPutType = "male";
  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.symmetric(horizontal:40.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "type_".tr,fontW: FW.semibold,),
            Row(
              children: [
                Radio(
                  focusColor:  kCMain,
                  activeColor: kCMain,
                  hoverColor: kCMain,
                  groupValue: userInPutType,
                  value: types[0].val,
                  onChanged: (dynamic value){
                    setState(() {
                      debugPrint(value);
                      userInPutType = value;
                      widget.onTap(value);
                      // _.estGender = userInPutType;
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
                  value: types[1].val,
                  onChanged: (dynamic value){
                    setState(() {
                      debugPrint(value);
                      userInPutType = value;
                      widget.onTap(value);
                      // _.estGender = userInPutType;
                    });
                  },
                ),
                CustomText(text: types[1].title,),
              ],
            ),
          ],
        ),
    );
  }
}
