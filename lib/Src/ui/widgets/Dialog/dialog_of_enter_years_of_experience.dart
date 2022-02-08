
import 'package:dr_dent/Src/bloc/controller/set_experience_years_controller.dart';
import 'package:dr_dent/Src/bloc/controller/year_of_graduation_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/year_of_graduation_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class DialogOfEnterYearsOfExperience extends StatelessWidget {
  const DialogOfEnterYearsOfExperience({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FetchYearsOfGraduationController());
    Get.put(SetExperienceYearsController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Material(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.h),
              color: Colors.white,
              height: 268.h,
              width: double.infinity,
              child: GetBuilder<SetExperienceYearsController>(
                builder:(_) =>  Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Enter_years_of_experience".tr,fontW: FW.medium,fontSize: 18,),
                    16.0.ESH(),
                    Form(
                      key: _.globalKey,
                      child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                YearOfGraduationButtonSheet(
                                  onTap: (title){
                                    _.graduationYearController!.text =title;
                                  },
                                ),
                                isScrollControlled: true);
                          },
                          child: TextFieldDefault(
                            hint: 'enter_year_of_graduation'.tr,
                            errorText: "error_enter_year_of_graduation_field".tr,
                            suffixIconData: Icons.keyboard_arrow_down_outlined,
                            controller: _.graduationYearController,
                            keyboardType: TextInputType.text,
                            filledColor: kCBGTextFormFiled,
                            fieldType: FieldType.WithBorder,
                            enable: false,
                            disableBorder: Colors.transparent,
                            enableBorder: Colors.transparent,
                            horizentalPadding: 16,
                          ),
                        ),
                    ),
                    24.0.ESH(),
                    Center(
                      child: ButtonDefault(
                       title: "save_".tr,
                        height: 48,
                        width: 140,
                        buttonColor: const Color(0xff345287),
                        onTap: () {
                          _.submit();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
