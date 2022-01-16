import 'package:dr_dent/Src/features/AuthFeature/bloc/controller/reset_password_controller.dart';
import 'package:dr_dent/Src/ui/widgets/TextFields/text_field_default.dart';
import 'package:dr_dent/Src/ui/widgets/appbars/app_bars.dart';
import 'package:dr_dent/Src/ui/widgets/buttons/button_default.dart';
import 'package:dr_dent/Src/ui/widgets/titles/title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/src/core/utils/extensions.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String phone;

  const ResetPasswordScreen({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());
    var node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBars.appBarDefault(title: 'forget_password'.tr),
      backgroundColor: Colors.white,
      body: GetBuilder<ResetPasswordController>(
        builder: (_) => SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _.globalKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      const TitleSubtitle(
                        tile: 'ادخل كلمة المرور الجديدة',
                        subtitle: '',
                      ),
                      TextFieldDefault(
                        hint: 'كلمة المرور الجديدة',
                        errorText: "يجب ادخال كلمة المرور الجديدة",
                        controller: _.passwordController,
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
                        hint: 'ادخل كلمة مرور',
                        errorText: "يجب ادخال كلمة المرور",
                        controller: _.confirmPasswordController,
                        secureType: SecureType.Toggle,
                        horizentalPadding: 16,
                        fieldType: FieldType.WithBorder,
                        // validation: passwordValidator,
                        prefixIconUrl: 'TFPassword',
                        onComplete: () {
                          node.unfocus();
                          _.submit(phone: phone);
                        },
                      ),
                      32.0.ESH(),
                      ButtonDefault(
                        title: 'save_'.tr,
                        onTap: () {
                          _.submit(phone: phone);
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
