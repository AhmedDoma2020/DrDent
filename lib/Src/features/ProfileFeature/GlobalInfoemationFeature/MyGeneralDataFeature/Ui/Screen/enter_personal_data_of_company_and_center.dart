import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_map_screen.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_sheet_of_company_&_center.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_sheet_of_doctor.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Controller/enter_personal_data_of_company_and_center_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/upload_image_container.dart';
import 'package:dr_dent/Src/features/BaseFeature/ui/screens/base_screen.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EnterPersonalDataOfCompanyAndCenterScreen extends StatelessWidget {
  final bool isEdit;

  const EnterPersonalDataOfCompanyAndCenterScreen(
      {Key? key, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EnterPersonalDataOfCompanyAndCenterController(isEdit: isEdit));
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarSkipDefault(
      title: "personal_info".tr,
      onTapBack: () {
        Get.back();
      },
      onTapSkip: () {
        Get.offAll(() => BaseScreen());
      }),
      body: GetBuilder<EnterPersonalDataOfCompanyAndCenterController>(
    builder: (_) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: _.globalKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 24.0.ESH(),
            // AvatarForm(
            //   futureImage: _.avatar,
            //   onTap:(val){
            //   _.setAvatar = val;
            // },isUpload: true,),
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
              enable: isEdit ? false : true,
              disableBorder: Colors.transparent,
              onComplete: () {
                node.nextFocus();
              },
            ),
            16.0.ESH(),
            TextFieldDefault(
              hint: 'Responsible_name'.tr,
              errorText: "error_responsible_name_field".tr,
              controller: _.administratorNameController,
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
              hint: 'Administrators_phone_number'.tr,
              errorText: "error_Administrators_phone_number_field".tr,
              controller: _.administratorPhoneController,
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

            InkWell(
              onTap: isEdit
                  ? () {
                      Get.to(
                        () => MapScreen(
                          targetPosition: LatLng(_.lat!, _.lon!),
                          onSave: (lat, lon, address) {
                            Get.bottomSheet(
                              SetLocationButtonSheetOfCompanyAndCenter(
                                lon: lon,
                                address: address,
                                lat: lat,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  : () {
                      Get.to(
                        () => MapScreen(
                          onSave: (lat, lon, address) {
                            Get.bottomSheet(
                              SetLocationButtonSheetOfCompanyAndCenter(
                                lon: lon,
                                address: address,
                                lat: lat,
                              ),
                            );
                          },
                        ),
                      );
                    },
              child: TextFieldDefault(
                hint: 'clinic_location'.tr,
                errorText: "error_clinic_location_filed".tr,
                controller: _.addressController,
                keyboardType: TextInputType.text,
                filledColor: kCBGTextFormFiled,
                fieldType: FieldType.WithBorder,
                enableBorder: Colors.transparent,
                prefixIconUrl: "TFLocation",
                enable: false,
                disableBorder: Colors.transparent,
                horizentalPadding: 16,
                onComplete: () {
                  node.nextFocus();
                },
              ),
            ),
            16.0.ESH(),
            TextFieldDefault(
              hint: 'commercial_registration_num'.tr,
              errorText: "error_commercial_registration_num_field".tr,
              controller: _.taxNumberController,
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
            UploadImageContainer(
              futureImage: _.futureTaxImage,
              onImageSelected: (image64) {
                _.setTaxNumberImage = image64;
              },
              onImageCleared: () {
                _.setFutureTaxImage = '';
              },
            ),
            16.0.ESH(),
            TextFieldDefault(
              hint: 'tax_record_num'.tr,
              errorText: "error_tax_record_num_field".tr,
              controller: _.logRecordController,
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
            UploadImageContainer(
              futureImage: _.futureLogImage,
              onImageSelected: (image64) {
                _.setLogRecordImage = image64;
              },
              onImageCleared: () {
                _.setFutureLogImage = '';
              },
            ),
            16.0.ESH(),
            TextFieldDefault(
              hint: 'about_company'.tr,
              errorText: "error_about_company_field".tr,
              controller: _.aboutController,
              keyboardType: TextInputType.multiline,
              filledColor: kCBGTextFormFiled,
              fieldType: FieldType.WithBorder,
              enableBorder: Colors.transparent,
              horizentalPadding: 16,
              maxLines: 4,
              onComplete: () {
                node.unfocus();
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
    );
  }
}
