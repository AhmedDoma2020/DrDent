import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/enter_my_personal_data_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_scientific_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_specialization_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/degree_bottun_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_sex_type_widget.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EnterMyPersonalDataScreen extends StatelessWidget {
  final bool isEdit;
  EnterMyPersonalDataScreen({ this.isEdit =false});
  @override
  Widget build(BuildContext context) {
    EnterMyPersonalDataController _enterMyPersonalDataController =
        Get.put(EnterMyPersonalDataController(isEdit: isEdit));
    Get.put(FetchSpecializationController());
    Get.put(FetchScientificController());
    var node = FocusScope.of(context);
    // _enterMyPersonalDataController.nameController!.text = name;
    // _enterMyPersonalDataController.degreeController!.text = "degree";
    // _enterMyPersonalDataController.specializationController!.text = specialization;
    return SafeArea(
        child: Scaffold(
      appBar: AppBars.appBarSkipDefault(
          title: "personal_info".tr,
          onTapBack: () {
            Get.back();
          },
          onTapSkip: () {
            Get.offAll(() => BaseScreen());
          }),
      body: GetBuilder<EnterMyPersonalDataController>(
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
                RowGenderWidget(
                  onTap: (gender) {
                    _.estGender = gender;
                  },
                ),
                16.0.ESH(),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(DegreeButtonSheet(
                      onTap: (scientificListTitle, scientificListId) {
                        _.degreeController!.text = scientificListTitle;
                        debugPrint("scientificListTitle $scientificListTitle");
                        _.setScientificId = scientificListId;
                        Get.back();
                      },
                    ), isScrollControlled: true);
                  },
                  child: TextFieldDefault(
                    hint: 'Degree_'.tr,
                    errorText: "must_set_Degree".tr,
                    suffixIconData: Icons.keyboard_arrow_down_outlined,
                    controller: _.degreeController,
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
                        specializationButtonSheet(
                          onTapNotEmpty:
                              (specializationIdList, specializationTitleList) {
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
                UploadPhotoContainer(
                  // getImage: getPhotoOfWorkLicenses,
                  title: "photo_of_Work_licenses",
                  onTap: (image64) {
                    _.setImage = image64;
                  },
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'add_info'.tr,
                  controller: _.addInfoController,
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
                ButtonDefault(
                  title: 'save_contain'.tr,
                  onTap: () {
                    _.submit();
                  },
                ),
                24.0.ESH(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
