import 'package:dr_dent/Src/bloc/controller/featch_state_and_city_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/city_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/state_button_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/top_title_in_button_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class JobClassificationButtonSheet extends StatelessWidget {
  final Function(int, int) onTap;

  JobClassificationButtonSheet({Key? key, required this.onTap})
      : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(FetchStateAndCityController());
    return Container(
      height: 320.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: GetBuilder<FetchStateAndCityController>(
        builder: (_) => Form(
          key: _globalKey,
          child: Column(
            children: [
              TopTitleInButtonSheet(title: "Job_classification".tr),
              16.0.ESH(),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                      StateButtonSheet(
                        stateList: _.stateAndCityList,
                        stateIndex: _.stateIndex,
                        onTap: (id, title) {
                          _.setStateIdSelected = id;
                          _.stateController!.text = title;
                        },
                      ),
                      isScrollControlled: true);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      TextFieldDefault(
                        hint: 'select_state'.tr,
                        errorText: "must_select_state".tr,
                        suffixIconData: Icons.keyboard_arrow_down_outlined,
                        controller: _.stateController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enable: false,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                    ],
                  ),
                ),
              ),
              16.0.ESH(),
              GestureDetector(
                onTap: () {
                  debugPrint("_.stateAndCityList is ${_.stateAndCityList}");
                  Get.bottomSheet(
                      CityButtonSheet2(
                        stateList: _.stateAndCityList,
                        setStateIndexSelected: _.stateIndexSelected,
                        cityIndex: _.cityIndex,
                        onTap: (id, title) {
                          _.setCityIdSelected = id;
                          _.cityController!.text = title;
                        },
                      ),
                      isScrollControlled: true);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      TextFieldDefault(
                        hint: 'select_city'.tr,
                        errorText: "must_select_city".tr,
                        suffixIconData: Icons.keyboard_arrow_down_outlined,
                        controller: _.cityController,
                        keyboardType: TextInputType.text,
                        filledColor: kCBGTextFormFiled,
                        fieldType: FieldType.WithBorder,
                        enable: false,
                        disableBorder: Colors.transparent,
                        enableBorder: Colors.transparent,
                        horizentalPadding: 16,
                      ),
                    ],
                  ),
                ),
              ),
              16.0.ESH(),
              ButtonDefault(
                title: 'search_'.tr,
                onTap: () {
                  if (_globalKey.currentState!.validate()) {
                    _globalKey.currentState!.save();
                    Get.back();
                    onTap(_.stateIdSelected, _.cityIdSelected);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
