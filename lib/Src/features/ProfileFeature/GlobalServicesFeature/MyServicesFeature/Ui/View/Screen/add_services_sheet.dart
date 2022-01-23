import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_available_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_available_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/set_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Ui/View/Screen/services_type_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class AddServicesSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        Get.put(SetServicesController());
        Get.put(FetchAvailableServicesController());
        var node = FocusScope.of(context);
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(19.r),
        topRight: Radius.circular(19.r),
      ),
      child: Container(
        width: double.infinity,
        height: 420.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19.r),
              topRight: Radius.circular(19.r),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: GetBuilder<SetServicesController>(
            builder: (_) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _.globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowTopBottomSheet(title: "insurance_companies".tr),
                        24.0.ESH(),
                        16.0.ESH(),
                        InkWell(
                          onTap: () {
                            debugPrint("ahooooooooooooo");
                            Get.bottomSheet(AvailableServicesButtonSheet(), isScrollControlled: true);
                          },
                          child: TextFieldDefault(
                            hint: 'services_type'.tr,
                            errorText: "must_select_services_type".tr,
                            controller: _.servicesTypeSelectedController,
                            suffixIconData: Icons.keyboard_arrow_down_outlined,
                            keyboardType: TextInputType.phone,
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
                          hint: 'services_duration'.tr,
                          errorText: "must_select_services_duration".tr,
                          controller: _.servicesDurationController,
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
                          hint: 'services_cost'.tr,
                          errorText: "must_select_services_cost".tr,
                          controller: _.servicesCostController,
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
                      ],
                    ),
                  ),
                  ButtonDefault(
                    title: 'save_'.tr,
                    onTap: () {
                      _.setServices();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}