import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/dialogs.dart';
import 'package:dr_dent/Src/core/utils/extensions.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/register_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/ui/widgets/avatar_form.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewAccountScreen extends StatelessWidget {
  final int userTypeSelectedId;
  const NewAccountScreen({Key? key, required this.userTypeSelectedId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint("userTypeSelectedId $userTypeSelectedId");
     Get.put(RegisterController());
    var node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBars.appBarDefault(
            title: "new_account".tr,
            onTap: () {
              Get.back();
            }),
        body: GetBuilder<RegisterController>(
          builder: (_) => SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _.globalKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          32.0.ESH(),
                          AvatarForm(
                            onTap: (img64) {
                              _.setImage = img64;
                            },
                          ),
                          32.0.ESH(),
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
                              node.nextFocus();
                            },
                          ),
                          16.0.ESH(),
                          userTypeSelectedId == 7 || userTypeSelectedId == 3
                              ? 0.0.ESW()
                              :
                          Column(
                                  children: [
                                    TextFieldDefault(
                                      hint: 'Responsible_name'.tr,
                                      errorText: "error_responsible_name_field".tr,
                                      controller: _.administratorsNameController,
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
                                      hint: 'Administrators_phone_number'.tr,
                                      errorText: "error_Administrators_phone_number_field".tr,
                                      controller: _.administratorsPhoneController,
                                      keyboardType: TextInputType.phone,
                                      fieldType: FieldType.WithBorder,
                                      prefixIconUrl: "TFPhone",
                                      horizentalPadding: 16,
                                      onComplete: () {
                                        node.nextFocus();
                                      },
                                    ),
                                    16.0.ESH(),
                                  ],
                                ),
                          TextFieldDefault(
                            hint: 'Email_'.tr,
                            controller: _.emailController,
                            keyboardType: TextInputType.emailAddress,
                            fieldType: FieldType.WithBorder,
                            prefixIconUrl: "TFEmail",
                            horizentalPadding: 16,
                            onComplete: () {
                              node.nextFocus();
                            },
                            validation: (String? vale){
                              if(vale!.isEmpty){
                                return "error_email_field".tr;
                              }
                              else if (!vale.contains("@")) {
                                return "Please_Enter_Right_Email".tr;
                              }
                            },
                          ),
                          16.0.ESH(),
                          TextFieldDefault(
                            hint: 'enter_password'.tr,
                            errorText: "error_password_field".tr,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _.passwordController,
                            secureType: SecureType.Toggle,
                            fieldType: FieldType.WithBorder,
                            prefixIconUrl: "TFPassword",
                            horizentalPadding: 16,
                            onComplete: () {
                              _.setUserTypeId = userTypeSelectedId;
                              node.unfocus();
                              _.submit();
                            },
                            validation: (String? vale){
                              if(vale!.isEmpty){
                                return "error_password_field".tr;
                              }
                              else if (vale.length < 6) {
                                return "The_secret_code_must_not_be_less_than_6_characters".tr;
                              }
                            },
                          ),
                          32.0.ESH(),
                          SizedBox(
                            width: 248.w,
                            child: GestureDetector(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'By_clicking_continue'.tr,
                                  style: TextStyle(
                                    color: kCBlackTitle,
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Privacy_&_Usage_Policy'.tr,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kCMain,
                                          fontSize: 14,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          32.0.ESH(),
                          ButtonDefault(
                            title: 'contain_'.tr,
                            onTap: () {
                              _.setUserTypeId = userTypeSelectedId;
                              _.submit();
                            },
                          ),
                          32.0.ESH(),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                      height: 52.h,
                      width: 22.w,
                      child: Image.asset(
                        "assets/image/teethStack1.png",
                        height: 52.h,
                        width: 22.w,
                      )),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 30.h,
                    width: 40.w,
                    child: Image.asset(
                      "assets/image/teethStack2.png",
                      height: 30.h,
                      width: 40.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
