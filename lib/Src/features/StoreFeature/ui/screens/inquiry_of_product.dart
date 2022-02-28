import 'package:dr_dent/Src/core/utils/request_status.dart';
import 'package:dr_dent/Src/ui/widgets/Dialog/loading_dialog.dart';

import '../../../../ui/widgets/TextFields/text_field_default.dart';
import '../../../ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Bloc/Controller/enter_personal_data_of_doctor_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/fetch_scientific_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/row_degree_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyOfferFeature/Ui/Widget/row_my_services_form.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyServicesFeature/Block/Controller/fetch_my_services_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/row_top_bottom_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../bloc/controller/inquiry_of_product_controller.dart';
import '/src/core/utils/extensions.dart';

class InquiryOfProductButtonSheet extends StatelessWidget {
  // final int idSelected;
  // final  Function onTap;
  // InquiryOfProductButtonSheet({Key? key, required this.onTap, this.idSelected = -1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(InquiryOfProductController());
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
          child:  GetBuilder<InquiryOfProductController>(
            builder:(_) =>  Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RowTopBottomSheet(title: "Request_for_price".tr),
                      24.0.ESH(),
                      TextFieldDefault(
                        hint: 'full_name'.tr,
                        errorText: "error_name_field".tr,
                        controller: _.nameController,
                        keyboardType: TextInputType.name,
                        fieldType: FieldType.WithBorder,
                        prefixIconUrl: "TFName",
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
                        fieldType: FieldType.WithBorder,
                        prefixIconUrl: "TFPhone",
                        horizentalPadding: 16,
                        onComplete: () {
                          node.unfocus();
                        },
                      ),
                    ],
                  ),
                  ButtonDefault(
                    title: 'send_'.tr,
                    onTap: () {
                      // _.submit();
                      Get.back();
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
