import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_company_and_center.dart';
import 'package:dr_dent/Src/features/ProfileFeature/GlobalServicesFeature/DoctorsFeature/Ui/View/add_center_doctor_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../GlobalInfoemationFeature/MyGeneralDataFeature/Ui/Screen/enter_personal_data_of_doctor_screen.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/upload_photo_of_work_licenses.dart';
import '../../Bloc/Controller/set_detection_location_details_controller.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_map_screen.dart';
import 'package:dr_dent/Src/features/LocationFeature/ui/screens/set_location_sheet.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SetDetectionLocationDetailsScreen extends StatelessWidget {
  final bool isAuth;
  SetDetectionLocationDetailsScreen(
      {
        this.isAuth = false ,
      });
GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    debugPrint("box.read('user_type_id') ${box.read('user_type_id')}");
    Get.put(SetWorkSpaceDetailsDetailsController(isAuth: isAuth));
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBars.appBarSkipDefault(
            title: "Detection_location_details".tr,
            onTapBack: () {Get.back();},
            isBack: isAuth ==true ? false:true,
            isSkip: isAuth ==true ? true:false,
            onTapSkip: () {
              if(box.read('user_type_id') == 3 ){
                Get.to(() => EnterPersonalDataOfDoctorScreen(isEdit: false,));
              }else if(box.read('user_type_id') == 4){
                Get.to(() => AddCenterDoctorScreen(isAuth: true,));
              }
            }),
        body: GetBuilder<SetWorkSpaceDetailsDetailsController>(
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
                      errorText: "error_clinic_name_field".tr,
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
                      controller: _.phone2Controller,
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
                      errorText: "error_price_examination_field".tr,
                      controller: _.priceExaminationController,
                      keyboardType: TextInputType.number,
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
                        Get.to(
                              () => MapScreen(
                            onSave: (lat, lon, address) {
                              Get.bottomSheet(SetLocationButtonSheet(
                                lon: lon,
                                address: address,
                                lat: lat,
                              ));
                            },
                          ),
                        );
                      },
                      child: TextFieldDefault(
                        hint: 'clinic_location'.tr,
                        errorText: "error_clinic_location_filed".tr,
                        controller: _.addressController,
                        keyboardType: TextInputType.text,
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
                    UploadPhotoContainer(
                      onTap: (image) {
                        _.setImg64= image;
                      },
                      title: "A_picture_of_the_clinic_or_center",
                    ),
                    32.0.ESH(),
                    ButtonDefault(
                      title: 'save_contain'.tr,
                      onTap: () {
                        _.setWorkSpace();
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