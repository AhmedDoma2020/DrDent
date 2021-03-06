import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_scientific_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_specialization_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/degree_bottun_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/bloc/controller/add_a_jop_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/job_requirements_widget.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/range_salary_widget.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/sheet_jobs_cities.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../ui/widgets/Radio/row_job_type_radio_widget.dart';
import '../../bloc/model/job_offer.dart';

class AddAJopOfferScreen extends StatelessWidget {
  final JobOffer? jobOffer;
  final bool isEdit;

  AddAJopOfferScreen({this.jobOffer, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAJopOfferController(isEdit: isEdit, jobOffer: jobOffer));
    Get.put(FetchScientificController());
    Get.put(FetchSpecializationController());
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(title: "add_jop_offer".tr, isBack: true),
      body: GetBuilder<AddAJopOfferController>(
        builder: (_) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _.globalKey,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.0.ESH(),
                TextFieldDefault(
                  hint: 'full_name'.tr,
                  errorText: "error_name_field".tr,
                  controller: _.nameController,
                  keyboardType: TextInputType.name,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  horizentalPadding: 16,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'enter_phone'.tr,
                  errorText: "error_phone_field".tr,
                  controller: _.phoneController,
                  keyboardType: TextInputType.phone,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  horizentalPadding: 16,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'enter_address'.tr,
                  errorText: "must_enter_address".tr,
                  controller: _.addressController,
                  keyboardType: TextInputType.name,
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
                      SheetJobsCities(
                        onSave: (id, title) {
                          _.setCityId = id;
                          _.cityController!.text = title;
                          Get.back();
                        },
                      ),
                    );
                  },
                  child: TextFieldDefault(
                    hint: 'select_city'.tr,
                    errorText: "must_select_city".tr,
                    controller: _.cityController,
                    suffixIconData: Icons.keyboard_arrow_down_outlined,
                    keyboardType: TextInputType.name,
                    filledColor: kCBGTextFormFiled,
                    fieldType: FieldType.WithBorder,
                    enableBorder: Colors.transparent,
                    horizentalPadding: 16,
                    enable: false,
                    disableBorder: Colors.transparent,
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                ),
                16.0.ESH(),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(DegreeButtonSheet(
                      onTap: (scientificListTitle, scientificListId) {
                        _.scientificLevelTitleController!.text =
                            scientificListTitle;
                        _.setScientificLevelId = scientificListId;
                        Get.back();
                      },
                    ), isScrollControlled: true);
                  },
                  child: TextFieldDefault(
                    hint: 'Degree_'.tr,
                    errorText: "must_set_Degree".tr,
                    suffixIconData: Icons.keyboard_arrow_down_outlined,
                    controller: _.scientificLevelTitleController,
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
                          specializationIdsSelected:
                              _.specializationIdSelected,
                          onTapNotEmpty: (specializationIdList,
                              specializationTitleList) {
                            _.setSpecializationIdSelected =
                                specializationIdList;
                            _.specializationController!.text =
                                specializationTitleList;
                          },
                          onTapEmpty: () {
                            _.specializationController!.clear();
                            _.setSpecializationIdSelected = [];
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
                    onComplete: () {
                      node.nextFocus();
                    },
                  ),
                ),
                16.0.ESH(),
                RangeSliderWidget(
                  isEdit: isEdit,
                  endSalary: _.endSalary,
                  startSalary: _.startSalary,
                  onSelected: (startSalary, endSalary) {
                    _.setStartSalary = startSalary;
                    _.setEndSalary = endSalary;
                  },
                ),
                16.0.ESH(),
                CustomText(
                  text: "enter_jop".tr,
                  fontW: FW.semicond,
                  fontSize: 16,
                ),
                RowJobTypeRadioWidget(
                  userInPutType: _.jobTypeId,
                  onTap: (id) {
                    debugPrint("_jobTypeId is $id");
                    _.setJobTypeId = id;
                    debugPrint("_jobTypeId is2 ${_.jobTypeId}");
                  },
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'job_description'.tr,
                  controller: _.jobDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  horizentalPadding: 16,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                JobRequirementsWidget(),
                16.0.ESH(),
                ButtonDefault(
                  title: 'save_'.tr,
                  onTap: () {
                    // debugPrint("startSalary ${_.startSalary!.toInt()}");
                    // debugPrint("endSalary ${_.endSalary!.toInt()}");
                    // debugPrint("SpecializationIdSelected ${_.specializationIdSelected}");
                    // debugPrint("ServicesId ${_.servicesId}");
                    _.submit();
                  },
                ),
                24.0.ESH(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
