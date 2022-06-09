import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/change_password_controller.dart';
import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/reset_password_controller.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'change_password'.tr),
      backgroundColor: Colors.white,
      body: GetBuilder<ChangePasswordController>(
        init: ChangePasswordController(),
        builder: (_) => SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _.globalKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      // const TitleSubtitle(
                      //   tile: 'create_new_password',
                      //   subtitle: '',
                      // ),
                      TextFieldDefault(
                        hint: 'old_password'.tr,
                        errorText: "error_password_field".tr,
                        controller: _.oldPasswordController,
                        secureType: SecureType.Toggle,
                        fieldType: FieldType.WithBorder,
                        horizentalPadding: 16,
                        // validation: passwordValidator,
                        prefixIconUrl: 'TFPassword',
                        onComplete: () {
                          node.nextFocus();
                        },
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'new_password'.tr,
                        errorText: "error_new_password_field".tr,
                        controller: _.newPasswordController,
                        secureType: SecureType.Toggle,
                        horizentalPadding: 16,
                        fieldType: FieldType.WithBorder,
                        // validation: passwordValidator,
                        prefixIconUrl: 'TFPassword',
                        onComplete: () {
                          node.unfocus();
                          // _.submit(phone: phone);
                        },
                      ),
                      16.0.ESH(),
                      TextFieldDefault(
                        hint: 'confirm_new_password'.tr,
                        // errorText: "error_confirm_password_field".tr,
                        controller: _.confirmNewPasswordController,
                        secureType: SecureType.Toggle,
                        horizentalPadding: 16,
                        fieldType: FieldType.WithBorder,
                        validation: (val){
                            if(val != _.newPasswordController!.text){
                            return 'error_confirm_password_field';
                          }
                        },
                        prefixIconUrl: 'TFPassword',
                        onComplete: () {
                          node.unfocus();
                          _.submit();
                        },
                      ),
                      32.0.ESH(),
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                          _.submit();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
