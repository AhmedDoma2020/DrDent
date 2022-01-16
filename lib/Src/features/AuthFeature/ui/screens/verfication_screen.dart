import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:dr_dent/Src/core/services/pin_code.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/verfication_controller.dart';
import 'package:dr_dent/Src/ui/widgets/GeneralWidgets/custom_text.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/custom_snack_bar.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_tow_in_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class VerificationScreen extends StatelessWidget {
  final String? phone;
  final bool register;
  final Function? onSuccess;
  final String? validationCode;

  VerificationScreen({
    required this.phone,
    this.register = true,
    this.validationCode,
    this.onSuccess,
  });
  VerficationController _verficationController = Get.put(VerficationController());

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'pin_code'.tr),
      backgroundColor: Colors.white,
      body: GetBuilder<VerficationController>(
        builder: (_) => KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) => Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _.globalKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 55.h),
                          child: Column(
                            children: [
                              CustomText(
                                text: 'confirm_pin_code'.tr,
                                fontW: FW.regular,
                                // TODO convert font type to demi
                                fontSize: 16,
                                color: kCMainBlack,
                              ),
                              CustomText(
                                text: 'confirm_pin_code_sub_title'.tr,
                                fontW: FW.regular,
                                fontSize: 12,
                                color: kCMainBlack,
                              ),
                              CustomText(
                                text: phone,
                                fontW: FW.regular,
                                fontSize: 12,
                                color: kCMainBlack,
                              ),
                            ],
                          )),
                      CustomText(
                        text: '00:59',
                        color: kCMainBlack,
                        fontSize: 39,
                        fontW: FW.bold,
                      ),
                      25.0.ESH(),
                      PinCodeServices.pinCodeWidget(
                          context: context,
                          textEditingController: _.  textEditingController!,
                          errorController: _.errorController!),
                      32.0.ESH(),
                      ButtonDefault(
                        title: 'متابعة',
                        onTap: () {
                          submit(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              isKeyboardVisible
                  ? 0.0.ESH()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Container(
                            child: TitleTwoInLine(
                          tile: 'لم تستلم رسالة ؟',
                          secondTile: 'إعادة إرسال',
                          secondTileColor: kCMain,
                          onTap: () {
                            // _.moveToRegister();
                          },
                        )),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    if (_verficationController.textEditingController!.text == 6) {
      // Get.off(GoogleMapScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
      // Get.offAll(ResetPasswordScreen(phone:widget.phone),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
      try {
        await onSuccess!(validationCode,_verficationController.textEditingController!.text);
      } catch (e) {
        // print(e);
        Get.back();
        Get.back();
        customSnackBar(title:  e.toString().contains("The SMS verification code used to create the phone auth credential is invalid")?
        "تآكد من الكود واعد المحاولة":
        "تآكد من الكود واعد المحاولة",);

        // Get.dialog(
        //     DefaultDialog(
        //       isOneAction: true,
        //       onOneActionTap: () {
        //         Get.back();
        //       },
        //       oneActionTitle: "المحاولة مرة اخري",
        //       title:
        //       e.toString().contains("The SMS verification code used to create the phone auth credential is invalid")?
        //       "تآكد من الكود واعد المحاولة":
        //       "حدث خطا ما",
        //       subtitle: "حاول مرة اخري",
        //     ));
        print(e);
      }
    }
  }
}

