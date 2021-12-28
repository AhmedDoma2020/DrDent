import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/enter_my_personal_data_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/degree_bottun_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_sex_type_widget.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import 'package:dr_dent/Src/features/DetectionLocationDetails/Ui/Widget/upload_photo_widget.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EnterMyPersonalDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(EnterMyPersonalDataController());
    var node = FocusScope.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBars.appBarSkipDefault(title: "personal_info".tr,),
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
                RowGenderWidget(),
                16.0.ESH(),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(DegreeButtonSheet(),isScrollControlled: true);
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
                    Get.bottomSheet(specializationButtonSheet(),isScrollControlled: true);
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
                UploadPhotoOfWordLicenses(),
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
