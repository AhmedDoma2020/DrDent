import 'package:dr_dent/Src/bloc/controller/featch_state_and_city_controller.dart';
import 'package:dr_dent/Src/bloc/controller/fetch_university_controller.dart';
import 'package:dr_dent/Src/bloc/controller/university_degree_controller.dart';
import 'package:dr_dent/Src/bloc/controller/year_of_graduation_controller.dart';
import 'package:dr_dent/Src/bloc/model/univeristy_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_sex_type_widget.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/add_jop_request_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/enter_your_information_to_apply_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/attach_your_cv_widget.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/city_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/state_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/university_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/top_title_in_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'university_degree_button_sheet.dart';
import 'year_of_graduation_button_sheet.dart';

class EnterYourInformationButtonSheet extends StatelessWidget {
  String baseImage64="";
  @override
  Widget build(BuildContext context) {
    Get.put(EnterYourInformationToApplyJobController());
    Get.put(FetchUniversityController());
    Get.put(FetchUniversityDegreeController());
    Get.put(FetchYearsOfGraduationController());
    return Container(
      height: 700.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: GetBuilder<EnterYourInformationToApplyJobController>(
        builder: (_) => Form(
          key: _.globalKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopTitleInButtonSheet(title: "Job_request".tr),
                16.0.ESH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        keyboardType: TextInputType.phone,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'Email_'.tr,
                        errorText: "error_email_field".tr,
                        controller: _.emailController,
                        keyboardType: TextInputType.emailAddress,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                      16.0.ESH(),
                      RowGenderWidget(
                        onTap: (gender){
                          _.setGender = gender;
                        },
                      ),
                      16.0.ESH(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              UniversitiesButtonSheet(
                                idSelected: _.universityId!,
                                onTap: (id,title){
                                  _.universityController!.text =title;
                                  _.setUniversityId = id;
                                },
                              ),
                              isScrollControlled: true);
                        },
                        child: TextFieldDefault(
                          hint: 'enter_university'.tr,
                          errorText: "error_enter_university_field".tr,
                          suffixIconData: Icons.keyboard_arrow_down_outlined,
                          controller: _.universityController,
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
                      GestureDetector(
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
                          filledColor: kCBGTextFormFiled,
                          fieldType: FieldType.WithBorder,
                          disableBorder: Colors.transparent,
                          enableBorder: Colors.transparent,
                          controller: _.graduationYearController,
                          keyboardType: TextInputType.text,
                          enable: false,

                          horizentalPadding: 16,
                        ),
                      ),
                      16.0.ESH(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              UniversityDegreeButtonSheet(
                                onTap: (id,title){
                                  _.universityDegreeController!.text =title;
                                },
                              ),
                              isScrollControlled: true);
                        },
                        child: TextFieldDefault(
                          hint: 'enter_university_degree'.tr,
                          errorText: "error_enter_university_degree_field".tr,
                          suffixIconData: Icons.keyboard_arrow_down_outlined,
                          controller: _.universityDegreeController,
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
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              SpecializationButtonSheet(specializationIdsSelected: [],

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
                      UploadPhotoContainer(
                        title: "graduation_certificate_image",
                        onTap: (image64){
                          _.setGraduationCertificateImage = image64;
                        },
                      ),
                      16.0.ESH(),
                      AttachYourCVIWidget(
                        onTap: (image64){
                          _.setCVImage=image64;
                        },
                      ),
                      16.0.ESH(),
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                          _.submit();
                        },
                      ),
                      16.0.ESH(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
