import 'package:dr_dent/Src/bloc/model/specialization_model.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_specialization_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_sex_type_widget.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/add_center_doctor_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/featch_job_title_and_specialization_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Bloc/Controller/featch_job_title_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/job_title_and_specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/Widget/job_title_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../../../bloc/model/center_doctor_model.dart';

class AddCenterDoctorScreen extends StatelessWidget {
  final bool isAuth;
  final bool isEdit;
  final CenterDoctorModel? centerDoctorModel;


  AddCenterDoctorScreen({this.centerDoctorModel, this.isAuth = false,this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCenterDoctorController(isAuth: isAuth,isEdit:isEdit,centerDoctorModel:centerDoctorModel ));
    // Get.put(FetchJobTitleAndSpecializationController());
    Get.put(FetchJobTitleController());
    Get.put(FetchSpecializationController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: "center_doctors".tr, isBack: true),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<AddCenterDoctorController>(
              builder:(_) =>  Form(
                key: _.globalKey,
                child: Column(
                  children: [
                    32.0.ESH(),
                    AvatarForm(
                      futureImage: _.futureAvatar,
                      onTap: (img64) {
                        _.setAvatar =img64;
                      },
                    ),
                    24.0.ESH(),
                    TextFieldDefault(
                      hint: 'doctor_name_text_field'.tr,
                      errorText: "error_doctor_name_text_field".tr,
                      controller: _.nameController,
                      keyboardType: TextInputType.text,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      disableBorder: Colors.transparent,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    16.0.ESH(),
                    RowGenderWidget(onTap: (val){
                      _.setGender = val;
                    },),
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
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    16.0.ESH(),
                    TextFieldDefault(
                      hint: 'price_examination'.tr,
                      errorText: "error_price_examination_field".tr,
                      controller: _.priceExaminationController,
                      keyboardType: TextInputType.number,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    16.0.ESH(),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                            JobTitleButtonSheet(
                              onTap: (id,title){
                                _.jobTitleController!.text=title;
                                _.setJopTitleId = id;
                                // _.universityController!.text =title;
                              },
                            ),
                            isScrollControlled: true);
                      },
                      child: TextFieldDefault(
                        hint: 'jop_title'.tr,
                        errorText: "error_jop_title_field".tr,
                        suffixIconData: Icons.keyboard_arrow_down_outlined,
                        controller: _.jobTitleController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enable: false,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                    ),
                    16.0.ESH(),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                            SpecializationButtonSheet(
                              specializationIdsSelected: _.specializationIdSelected,
                              onTapNotEmpty:
                                  (specializationIdList, specializationTitleList) {
                                _.setSpecializationIdSelected = specializationIdList;
                                _.jobTitleAndSpecializationController!.text = specializationTitleList;
                              },
                              onTapEmpty: () {
                                _.jobTitleAndSpecializationController!.clear();
                                _.setSpecializationIdSelected = [];
                              },
                            ),
                            isScrollControlled: true);
                        // Get.bottomSheet(
                        //     JobTitleAndSpecializationButtonSheet(
                        //       onTap: (id,title){
                        //         _.jobTitleAndSpecializationController!.text=title;
                        //       },
                        //     ),
                        //     isScrollControlled: true);
                      },
                      child: TextFieldDefault(
                        hint: 'jop_title_and_specialization'.tr,
                        errorText: "error_jop_title_and_specialization_field".tr,
                        suffixIconData: Icons.keyboard_arrow_down_outlined,
                        controller: _.jobTitleAndSpecializationController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enable: false,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                    ),
                    16.0.ESH(),
                    TextFieldDefault(
                      hint: 'add_info'.tr,
                      errorText: "error_add_info_field".tr,
                      controller: _.noteController,
                      keyboardType: TextInputType.multiline,
                      filledColor: kCBGTextFormFiled,
                      fieldType: FieldType.WithBorder,
                      disableBorder: Colors.transparent,
                      enableBorder: Colors.transparent,
                      horizentalPadding: 16,
                      maxLines: 5,
                      onComplete: () {
                        node.nextFocus();
                      },
                    ),
                    32.0.ESH(),
                    ButtonDefault(
                      title: 'save_contain'.tr,
                      onTap: () {
                        _.submit();
                      },
                    ),
                    16.0.ESH(),
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
