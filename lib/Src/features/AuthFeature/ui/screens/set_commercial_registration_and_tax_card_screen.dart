import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/set_commercial_registration_and_tax_card_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/upload_image_container.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetCommercialRegistrationAndTaxCardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(SetCommercialRegistrationAndTaxCardController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarDefault(title: "image_of_commercial_registration_and_tax_card".tr, isBack: false),
        backgroundColor: Colors.white,
        body: GetBuilder<SetCommercialRegistrationAndTaxCardController>(
          builder:(_) =>  SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: SingleChildScrollView(
                child: Form(
                  key: _.globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "image_of_commercial_registration_and_tax_card".tr,
                            fontSize: 18,
                            fontW: FW.semibold,
                          ),
                          16.0.ESH(),
                          CustomText(
                            text: "image_of_commercial_registration_and_tax_card_sub_title".tr,
                            fontSize: 16,
                            fontW: FW.semibold,
                            color: kCGreyTitle,
                          ),
                          24.0.ESH(),
                          CustomText(text: "commercial_registration_data".tr,fontW: FW.medium,),
                          24.0.ESH(),
                          TextFieldDefault(
                            hint: 'tax_record_data'.tr,
                            errorText: "error_commercial_registration_num_field".tr,
                            controller: _.numOfCommercialRegistrationController,
                            keyboardType: TextInputType.phone,
                            fieldType: FieldType.WithBorder,
                            prefixIconUrl: "TFpersonalcard",
                            horizentalPadding: 16,
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          16.0.ESH(),
                          UploadImageContainer(
                            onImageSelected: (image64){
                              _.setLogImg64 = image64;
                            },
                          ),
                          24.0.ESH(),
                          CustomText(
                            text: "commercial_registration_data".tr,
                            fontW: FW.medium,
                          ),
                          24.0.ESH(),
                          TextFieldDefault(
                            hint: 'tax_record_num'.tr,
                            errorText:
                                "error_tax_record_num_field".tr,
                            controller: _.numOfTaxRegistrationController,
                            keyboardType: TextInputType.phone,
                            fieldType: FieldType.WithBorder,
                            prefixIconUrl: "TFpersonalcard",
                            horizentalPadding: 16,
                            onComplete: () {
                              node.nextFocus();
                            },
                          ),
                          16.0.ESH(),
                          UploadImageContainer(
                            onImageSelected: (image64) {
                              _.setTaxImg64 = image64;
                            },
                          ),
                          24.0.ESH(),
                        ],
                      ),
                      (_.logImg64 == null || _.logImg64 =="" ) || (_.taxImg64 == null || _.taxImg64 =="")
                          ? 0.0.ESH()
                          : ButtonDefault(
                        title: 'save_contain'.tr,
                        onTap: () {
                          // Get.to(() => WattingScreen());
                          // debugPrint("_.logImg64 ${_.logImg64}");
                          // debugPrint("_.taxImg64 ${_.taxImg64}");
                          _.submit();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

