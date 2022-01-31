import 'package:dr_dent/Src/bloc/controller/fetch_university_controller.dart';
import 'package:dr_dent/Src/bloc/controller/university_degree_controller.dart';
import 'package:dr_dent/Src/bloc/controller/year_of_graduation_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Controller/enter_personal_data_of_graduated_controller.dart';
import '../../Bloc/Controller/enter_personal_data_of_doctor_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_scientific_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_specialization_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/degree_bottun_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_sex_type_widget.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/specialization_button_sheet.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/attach_your_cv_widget.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/university_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/university_degree_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/screens/year_of_graduation_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EnterPersonalDataOfGraduatedScreen extends StatelessWidget {
  final bool isEdit;
  EnterPersonalDataOfGraduatedScreen({ this.isEdit =false});
  @override
  Widget build(BuildContext context) {
    Get.put(FetchUniversityController());
    Get.put(FetchUniversityDegreeController());
    Get.put(FetchYearsOfGraduationController());
    Get.put(EnterPersonalDataOfGraduatedController(isEdit: isEdit));
    // Get.put(FetchSpecializationController());
    // Get.put(FetchScientificController());
    var node = FocusScope.of(context);
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
          body: GetBuilder<EnterPersonalDataOfGraduatedController>(
            builder: (_) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _.globalKey,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.0.ESH(),
                    AvatarForm(onTap:(val){},isUploade: true,),
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
                        Get.bottomSheet(
                            UniversitiesButtonSheet(
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
                            specializationButtonSheet(
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
