import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/Bloc/Controller/featch_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DetectionLocationDetails/View/Widget/available_work_space_sheet.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_available_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/set_services_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Ui/View/Screen/services_type_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../bloc/model/service_model.dart';
import '/src/core/utils/extensions.dart';

class AddServicesSheet extends StatelessWidget {
  final ServiceModel? serviceModel;
  final bool isEdit;
  AddServicesSheet({this.serviceModel, this.isEdit=false});

  @override
  Widget build(BuildContext context) {
    Get.put(SetServicesController(isEdit:isEdit ,serviceModel:serviceModel,));
    Get.put(FetchAvailableServicesController());
    // Get.put(FetchDetectionLocationDetailsController());
    var node = FocusScope.of(context);
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(19.r),
        topRight: Radius.circular(19.r),
      ),
      child: Container(
        width: double.infinity,
        // height: 500.h,
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
                        RowTopBottomSheet(title: "services_details".tr),
                        24.0.ESH(),
                        16.0.ESH(),
                        // InkWell(
                        //   onTap: () {
                        //     Get.bottomSheet(
                        //         AvailableWorkSpaceSheet(
                        //           onSelected: (idSelected,titleSelected) {
                        //             _.workSpaceSelectedController!.text = titleSelected;
                        //             _.setWorkSpaceId = idSelected;
                        //           },
                        //         ),
                        //         isScrollControlled: true);
                        //   },
                        //   child: TextFieldDefault(
                        //     hint: 'select_clinic'.tr,
                        //     errorText: "must_select_clint".tr,
                        //     controller: _.workSpaceSelectedController,
                        //     suffixIconData: Icons.keyboard_arrow_down_outlined,
                        //     keyboardType: TextInputType.phone,
                        //     filledColor: kCBGTextFormFiled,
                        //     fieldType: FieldType.WithBorder,
                        //     enable: false,
                        //     disableBorder: Colors.transparent,
                        //     enableBorder: Colors.transparent,
                        //     horizentalPadding: 16,
                        //     onComplete: () {
                        //       node.nextFocus();
                        //     },
                        //   ),
                        // ),
                        // 16.0.ESH(),
                        InkWell(
                          onTap: isEdit ?(){}:() {
                            Get.bottomSheet(AvailableServicesButtonSheet(
                              onSelected: (idSelected,titleSelected) {
                                _.servicesTypeSelectedController!.text=titleSelected;
                                _.setServicesId=idSelected;
                                },
                            ), isScrollControlled: true);
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
