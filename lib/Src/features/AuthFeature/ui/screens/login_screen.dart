import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/login_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/login_with_gmail_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_or_row.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_tow_in_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    LoginWithGoogleIdController _loginWithGoogleIdController = Get.put(LoginWithGoogleIdController());
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'log_in'.tr,isBack: false),
      backgroundColor: Colors.white,
      body: GetBuilder<LoginController>(
        builder: (_) => KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _.globalKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.0.ESH(),
                          Center(
                            child: SizedBox(
                              height: 52.h,
                              width: 110.w,
                              child: Image.asset(
                                "assets/image/logo.png",
                                height: 52.h,
                                width: 110.w,
                              ),
                            ),
                          ),
                          28.0.ESH(),
                          CustomText(
                            text: "welcome_again".tr,
                            fontW: FW.semibold,
                            fontSize: 24,
                          ),
                          24.0.ESH(),
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
                          TextFieldDefault(
                            hint: 'enter_password'.tr,
                            errorText: "error_password_field".tr,
                            controller: _.passwordController,
                            secureType: SecureType.Toggle,
                            fieldType: FieldType.WithBorder,
                            prefixIconUrl: "TFPassword",
                            horizentalPadding: 16,
                            validation: (String? vale){
                              if(vale!.isEmpty){
                                return "error_password_field".tr;
                              }
                              else if (vale.length < 6) {
                                return "The_secret_code_must_not_be_less_than_6_characters".tr;
                              }
                            },
                            onComplete: () {
                              node.unfocus();
                              _.submit();
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              _.moveToForgetPassword();
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 16.w,
                                    top: 16.h,
                                    bottom: 24.h),
                                child: CustomText(
                                  text: "forget_password?".tr,
                                  fontW: FW.semibold,
                                  fontSize: 14,
                                  color: kCMain,
                                ),
                              ),
                            ),
                          ),

                          // TitleOrRow(),
                          // 18.0.ESH(),
                          // ButtonDefault(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Image.asset(
                          //         'assets/icons/google.png',
                          //         height: 16.h,
                          //       ),
                          //       16.0.ESW(),
                          //       CustomText(
                          //         text: 'sign_in_with_google'.tr,
                          //         color: const Color(0xff05080D),
                          //         fontSize: 14,
                          //         fontW: FW.regular,
                          //       ),
                          //     ],
                          //   ),
                          //   buttonColor: kCActiveButton.withOpacity(0.08),
                          //   onTap: () {
                          //     _loginWithGoogleIdController.signInWithGoogleMethod();
                          //   },
                          // ),
                          // 23.0.ESH(),
                          // ButtonDefault(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Image.asset(
                          //         'assets/icons/faceBook.png',
                          //         height: 16.h,
                          //       ),
                          //       16.0.ESW(),
                          //       CustomText(
                          //         text: 'sign_in_with_faceBook'.tr,
                          //         color: Colors.white,
                          //         fontSize: 14,
                          //         fontW: FW.regular,
                          //       ),
                          //     ],
                          //   ),
                          //   buttonColor: const Color(0xff345287),
                          //   onTap: () {
                          //     _.submit();
                          //   },
                          // ),
                          // 40.0.ESH(),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ButtonDefault(
                      title: 'log_in'.tr,
                      onTap: () {
                        _.submit();
                      },
                    ),
                    32.0.ESH(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Container(
                          child: TitleTwoInLine(
                            tile: 'ليس لديك حساب بعد ؟ ',
                            secondTile: 'إنشاء حساب',
                            tileSize: 16.0,
                            onTap: () {
                              _.moveToRegister();
                            },
                          )),
                    ),
                  ],
                )
                // 32.0.ESH(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
