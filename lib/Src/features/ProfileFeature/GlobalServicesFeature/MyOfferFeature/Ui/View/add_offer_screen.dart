import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Bloc/Controller/set_offer_and_discount_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/select_offer_duration.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/upload_offer_photo.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'add_services_sheet_in_add_offer_screen.dart';

class AddOfferAndDiscountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(FetchAvailableInsurancesController());
    Get.put(SetOfferAndDiscountController());
    Get.put(FetchMyServicesController());
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(
      title: "add_offer".tr,
      onTap: () {
        Get.back();
      }),
      body: GetBuilder<SetOfferAndDiscountController>(
    builder: (_) => Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: _.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'offer_name'.tr,
                  errorText: "error_offer_name".tr,
                  controller: _.nameController,
                  keyboardType: TextInputType.text,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  horizentalPadding: 16,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                GetBuilder<FetchMyServicesController>(
                  builder: (myServicesController) => InkWell(
                    onTap: myServicesController.status ==
                            RequestStatus.loading
                        ? () {
                            customSnackBar(
                              title: "loading_Data".tr,
                            );
                          }
                        : myServicesController.myServicesList.isEmpty
                            ? () {
                                customSnackBar(
                                    title: "no_service_selected_title".tr,
                                    subtitle:
                                        "no_service_selected_sup_title".tr);
                              }
                            : () {
                                Get.bottomSheet(AddServicesButtonSheet(
                                  onTap: () {
                                    _.servicesIdSelectedList.clear();
                                    _.servicesTitleSelectedList.clear();
                                    for (var item in myServicesController
                                        .myServicesList) {
                                      if (item.selected) {
                                        _.servicesIdSelectedList
                                            .add(item.id);
                                        _.servicesTitleSelectedList
                                            .add(item.title);
                                      }
                                    }
                                    debugPrint(
                                        "servicesIdSelectedList ${_.servicesIdSelectedList}");
                                    _.servicesSelectedController!.text = _
                                        .servicesTitleSelectedList
                                        .join(",");
                                    Get.back();
                                  },
                                ), isScrollControlled: true);
                              },
                    child: TextFieldDefault(
                      hint: 'select_services'.tr,
                      errorText: "error_select_services".tr,
                      suffixIconData: Icons.keyboard_arrow_down_outlined,
                      controller: _.servicesSelectedController,
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
                ),
                16.0.ESH(),
                SelectOfferDurationRow(
                  node: node,
                  offerDurationController: _.offerDurationController!,
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'price_before_discount'.tr,
                  errorText: "error_price_before_discount".tr,
                  controller: _.priceController,
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
                  hint: 'price_after_discount'.tr,
                  errorText: "error_price_after_discount".tr,
                  controller: _.priceAfterDiscountController,
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
                  hint: 'offer_details'.tr,
                  errorText: "error_offer_details".tr,
                  controller: _.offerInfoController,
                  keyboardType: TextInputType.text,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  horizentalPadding: 16,
                  maxLines: 3,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                TextFieldDefault(
                  hint: 'booking_details'.tr,
                  errorText: "error_booking_details".tr,
                  controller: _.bookingInfoController,
                  keyboardType: TextInputType.text,
                  filledColor: kCBGTextFormFiled,
                  fieldType: FieldType.WithBorder,
                  enableBorder: Colors.transparent,
                  maxLines: 3,
                  horizentalPadding: 16,
                  onComplete: () {
                    node.nextFocus();
                  },
                ),
                16.0.ESH(),
                UploadOfferPhoto(),
                16.0.ESH(),
                ButtonDefault(
                    title: 'save_contain'.tr,
                    onTap: () {
                      // _.submit();
                      _.setOfferAndDiscount();
                    }),
                16.0.ESH(),
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
