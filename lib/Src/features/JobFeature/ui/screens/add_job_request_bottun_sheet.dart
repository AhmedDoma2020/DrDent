import 'package:dr_dent/Src/bloc/controller/featch_state_and_city_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/add_jop_request_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/attach_your_cv_widget.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/city_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/state_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/top_title_in_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../AuthFeature/bloc/controller/fetch_specialization_controller.dart';

class AddJobRequestButtonSheet extends StatelessWidget {
String baseImage64="";
  @override
  Widget build(BuildContext context) {
     Get.put(AddJopRequestController());
     Get.put(FetchSpecializationController());
    return Container(
      height: 520.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: GetBuilder<AddJopRequestController>(
        builder: (_) => Form(
          key: _.globalKey,
          child: ListView(
            children: [
              TopTitleInButtonSheet(title: "Job_request".tr),
              16.0.ESH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldDefault(
                        hint: 'full_name'.tr,
                        errorText: "error_name_field".tr,
                        controller: _.nameController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'enter_phone'.tr,
                        errorText: "error_phone_field".tr,
                        controller: _.phoneController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'enter_address'.tr,
                        errorText: "must_enter_address".tr,
                        controller: _.addressController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                      16.0.ESH(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              SpecializationButtonSheet(
                                specializationIdsSelected: [],

                                onTapNotEmpty: (specializationIdList,specializationTitleList){
                                  _.setSpecializationIdSelected = specializationIdList;
                                  _.specializationController!.text=specializationTitleList;
                                },
                                onTapEmpty: (){
                                  _.specializationController!.clear();
                                  _.setSpecializationIdSelected=[];
                                },
                              ),
                              isScrollControlled: true);
                        },
                        child: TextFieldDefault(
                          hint: 'Specialization_'.tr,
                          errorText: "must_setSpecialization".tr,
                          suffixIconData: Icons.keyboard_arrow_down_outlined,
                          controller: _.specializationController,
                          keyboardType: TextInputType.text,
                          filledColor: kCBGTextFormFiled,
                          fieldType: FieldType.WithBorder,
                          enable: false,
                          disableBorder: Colors.transparent,
                          enableBorder: Colors.transparent,
                          horizentalPadding: 16,
                        ),
                      ),
                      16.0.ESH(),
                      AttachYourCVIWidget(
                        onTap: (image64){
                          baseImage64=image64;
                        },
                      ),
                      16.0.ESH(),
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                          _.submit();
                          // debugPrint("baseImage64 $baseImage64");
                          // if (_globalKey.currentState!.validate()) {
                          //   _globalKey.currentState!.save();
                          //   Get.back();
                          // }
                        },
                      ),
                      16.0.ESH(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
