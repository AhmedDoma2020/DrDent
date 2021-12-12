import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Controller/set_location_sheet_controller.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/city_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class SetLocationButtonSheet extends StatefulWidget {
  @override
  State<SetLocationButtonSheet> createState() => _SetLocationButtonSheetState();
}

class _SetLocationButtonSheetState extends State<SetLocationButtonSheet> {
  @override
  Widget build(BuildContext context) {
    FetchCityAndSetLocationSheetController _cityController =
        Get.put(FetchCityAndSetLocationSheetController());
    var node = FocusScope.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(19.r),
          topRight: Radius.circular(19.r),
        ),
        child: Container(
          width: double.infinity,
          height: 520.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GetBuilder<FetchCityAndSetLocationSheetController>(
                builder: (_) => Form(
                  key: _.globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      24.0.ESH(),
                      RowTopBottomSheet(title: "location_setting".tr),
                      32.0.ESH(),
                      InkWell(
                        onTap: () {
                          print("ahooooooooooooo");
                          Get.bottomSheet(CityButtonSheet(cityList: _.cityList!,));
                        },
                        child: TextFieldDefault(
                          hint: 'location_setting'.tr,
                          errorText: "must_set_city".tr,
                          controller: _.cityController,
                          // keyboardType: TextInputType.phone,
                          suffixIconData: Icons.keyboard_arrow_down_outlined,
                          enable: false,
                          disableBorder: Colors.transparent,
                          filledColor: kCBGTextFormFiled,
                          fieldType: FieldType.WithBorder,
                          enableBorder: Colors.transparent,
                          horizentalPadding: 16,
                          onComplete: () {
                            node.nextFocus();
                          },
                        ),
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'build_num'.tr,
                        controller: _.buildNumController,
                        keyboardType: TextInputType.phone,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                      16.0.ESH(), TextFieldDefault(
                        hint: 'flat_and_flour_num'.tr,
                        controller: _.flatNumController,
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
                        hint: 'sp_marker'.tr,
                        controller: _.spMarkController,
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
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                          _.submit();
                        },
                      ),
                      22.0.ESH(),
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
