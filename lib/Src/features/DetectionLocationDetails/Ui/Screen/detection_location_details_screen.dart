import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/DetectionLocationDetails/Block/Controller/detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/DetectionLocationDetails/Ui/Widget/upload_photo_widget.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_map_screen.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DetectionLocationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DetectionLocationDetailsController _detectionLocationDetailsController =
        Get.put(DetectionLocationDetailsController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarSkipDefault(
          title: "Detection_location_details".tr,
          onTap: () {
            Get.back();
          },
        ),
        body: GetBuilder<DetectionLocationDetailsController>(
          builder: (_) => Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            height: double.infinity,
            width: double.infinity,
            child: Form(
              key: _.globalKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    32.0.ESH(),
                    TextFieldDefault(
                      hint: 'clinic_name'.tr,
                      errorText: "error_phone_field".tr,
                      controller: _.phone1Controller,
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
                      hint: 'enter_phone'.tr,
                      errorText: "error_phone_field".tr,
                      controller: _.phone1Controller,
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
                      hint: 'anather_phone_number'.tr,
                      controller: _.phone1Controller,
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
                      hint: 'price_examination'.tr,
                      controller: _.phone1Controller,
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
                      onTap: () {
                        Get.to(() => MapScreen(onSave: (lat, lon, address) {
                              Get.bottomSheet(SetLocationButtonSheet());
                            }));
                      },
                      child: TextFieldDefault(
                        hint: 'clinic_location'.tr,
                        errorText: "error_phone_field".tr,
                        controller: _.phone1Controller,
                        keyboardType: TextInputType.phone,
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
                    InkWell(
                      onTap: () {},
                      child: TextFieldDefault(
                        hint: 'jop_time'.tr,
                        errorText: "error_phone_field".tr,
                        controller: _.phone1Controller,
                        keyboardType: TextInputType.phone,
                        filledColor: kCBGTextFormFiled,
                        enableBorder: Colors.transparent,
                        fieldType: FieldType.WithBorder,
                        disableBorder: Colors.transparent,
                        prefixIconUrl: "TFClender",
                        enable: false,
                        horizentalPadding: 16,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                    ),
                    16.0.ESH(),
                    const UploadPhoto(),
                    32.0.ESH(),
                    ButtonDefault(
                      title: 'save_contain'.tr,
                      onTap: () {
                        _.submit();
                      },
                    ),
                    32.0.ESH(),
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
