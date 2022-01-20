import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/InsuranceCompaniesFeature/Bloc/Controller/fetch_available_insurances_controller.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/MyAssistantDataFeature/Bloc/Controller/set_edit_assistant_data_controller.dart';
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

class AddAssistantSheet extends StatelessWidget {
  final int id;
  final String phone;
  final String name;
  final bool isEdit;

  AddAssistantSheet({this.id =0 ,this.phone = '', this.name ='',this.isEdit=false});

  @override
  Widget build(BuildContext context) {
    Get.put(FetchAvailableInsurancesController());
    SetAssistantController _setAssistantController = Get.put(SetAssistantController(phone: phone,
    name:name ,
    ));

    var node = FocusScope.of(context);
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(19.r),
        topRight: Radius.circular(19.r),
      ),
      child: Container(
        width: double.infinity,
        height: 340.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19.r),
              topRight: Radius.circular(19.r),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: GetBuilder<SetAssistantController>(
            builder: (_) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: _.globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowTopBottomSheet(title: "assistant_data".tr),
                        24.0.ESH(),
                        TextFieldDefault(
                          hint: 'assistant_name'.tr,
                          errorText: "must_select_assistant_name".tr,
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
                          hint: 'phone_number'.tr,
                          errorText: "error_phone_field".tr,
                          controller: _.phoneController,
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
                      if(isEdit ==false ){
                        _.setAssistant();
                      }else{
                        if(id != 0){
                          _.editAssistant(assistantId: id);
                        }else{
                          debugPrint("Error In Assistant Id");
                        }
                      }
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