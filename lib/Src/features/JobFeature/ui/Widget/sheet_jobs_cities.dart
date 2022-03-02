import 'package:dr_dent/Src/bloc/controller/featch_state_and_city_controller.dart';
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import '../../../ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/set_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/city_button_sheet.dart';
import 'package:dr_dent/Src/features/JobFeature/ui/Widget/state_button_sheet.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/bloc/Controller/set_location_sheet_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class SheetJobsCities extends StatelessWidget {
  final Function(int) onSave;


  SheetJobsCities({required this.onSave});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchStateAndCityController());
    Get.put(SetWorkSpaceDetailsDetailsController());
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
          height: 320.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(19.r),
                topRight: Radius.circular(19.r),
              ),
              color: Colors.white),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<SetWorkSpaceDetailsDetailsController>(
              builder: (_) => Form(
                key: _.globalKey2,
                child: GetBuilder<FetchStateAndCityController>(
                  builder: (stateAndCity) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      24.0.ESH(),
                      RowTopBottomSheet(title: "location_setting".tr),
                      32.0.ESH(),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              StateButtonSheet(
                                stateList: stateAndCity.stateAndCityList,
                                stateIndex: stateAndCity.stateIndex,
                                onTap: (id, title) {
                                  _.setStateId = id;
                                  _.stateController!.text = title;
                                  _.setCityId = 0;
                                  _.cityController!.clear();
                                  stateAndCity.changeCityIndex(-1);
                                },
                              ),
                              isScrollControlled: true);
                        },
                        child: TextFieldDefault(
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
                      ),
                      16.0.ESH(),
                      GestureDetector(
                        onTap:stateAndCity.stateIndexSelected == -1? (){
                          customSnackBar(title: "must_select_state_first".tr);
                        }: () {
                          Get.bottomSheet(
                              CityButtonSheet2(
                                stateList: stateAndCity.stateAndCityList,
                                setStateIndexSelected: stateAndCity.stateIndexSelected,
                                cityIndex: stateAndCity.cityIndex,
                                onTap: (id, title) {
                                  _.setCityId = id;
                                  _.cityController!.text = title;
                                },
                              ),
                              isScrollControlled: true);
                        },
                        child: TextFieldDefault(
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
                      ),
                      16.0.ESH(),
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                         if(_.cityId!=null){
                           onSave(_.cityId!);
                         }
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
